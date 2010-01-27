class AdminController < ApplicationController
  def login
  	if request.post?
  		birder = Birder.authenticate(params[:user_name], params[:password])
  		if birder
  			session[:birder_id] = birder.id
  			redirect_to(:controller => "birders")
  		else
  			flash.now[:notice] = "Invalid user/password combination"
  		end
  	end
  end

  def logout
  end

end

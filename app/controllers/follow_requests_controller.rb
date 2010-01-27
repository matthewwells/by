class FollowRequestsController < ApplicationController
  # GET /follow_requests
  # GET /follow_requests.xml
  def index
    @follow_requests = FollowRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @follow_requests }
    end
  end

  # GET /follow_requests/1
  # GET /follow_requests/1.xml
  def show
    @follow_request = FollowRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @follow_request }
    end
  end

  # GET /follow_requests/new
  # GET /follow_requests/new.xml
  def new
    @follow_request = FollowRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @follow_request }
    end
  end

  # GET /follow_requests/1/edit
  def edit
    @follow_request = FollowRequest.find(params[:id])
  end

  # POST /follow_requests
  # POST /follow_requests.xml
  def create
    @follow_request = FollowRequest.new(params[:follow_request])

    respond_to do |format|
      if @follow_request.save
        flash[:notice] = 'FollowRequest was successfully created.'
        format.html { redirect_to(@follow_request) }
        format.xml  { render :xml => @follow_request, :status => :created, :location => @follow_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @follow_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follow_requests/1
  # PUT /follow_requests/1.xml
  def update
    @follow_request = FollowRequest.find(params[:id])

    respond_to do |format|
      if @follow_request.update_attributes(params[:follow_request])
        flash[:notice] = 'FollowRequest was successfully updated.'
        format.html { redirect_to(@follow_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @follow_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_requests/1
  # DELETE /follow_requests/1.xml
  def destroy
    @follow_request = FollowRequest.find(params[:id])
    @follow_request.destroy

    respond_to do |format|
      format.html { redirect_to(follow_requests_url) }
      format.xml  { head :ok }
    end
  end
end

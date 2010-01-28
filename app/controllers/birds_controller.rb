class BirdsController < ApplicationController
  # GET /birds
  # GET /birds.xml
  def index
    @birds = Bird.all :order => :vernacular_name
    @me_id = session[:birder_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @birds }
    end
  end

  # GET /birds
  # GET /birds.xml
  def matrix
    me = Birder.find_by_id(session[:birder_id])
    @birders = me.followees
    @birders = [me] + @birders
    @birds = Bird.all :order => :vernacular_name
    @me_id = session[:birder_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @birds }
    end
  end

  # GET /birds/1
  # GET /birds/1.xml
  def show
    @bird = Bird.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bird }
    end
  end

  # GET /birds/new
  # GET /birds/new.xml
  def new
    @bird = Bird.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bird }
    end
  end

  # GET /birds/1/edit
  def edit
    @bird = Bird.find(params[:id])
  end

  # POST /birds
  # POST /birds.xml
  def create
    @bird = Bird.new(params[:bird])

    respond_to do |format|
      if @bird.save
        flash[:notice] = 'Bird was successfully created.'
        format.html { redirect_to(:action => :index) }
        format.xml  { render :xml => @bird, :status => :created, :location => @bird }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bird.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /birds/1
  # PUT /birds/1.xml
  def update
    @bird = Bird.find(params[:id])

    respond_to do |format|
      if @bird.update_attributes(params[:bird])
        flash[:notice] = 'Bird was successfully updated.'
        format.html { redirect_to(@bird) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bird.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /birds/1
  # DELETE /birds/1.xml
  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy

    respond_to do |format|
      format.html { redirect_to(birds_url) }
      format.xml  { head :ok }
    end
  end
end

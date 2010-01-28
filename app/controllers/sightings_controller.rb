class SightingsController < ApplicationController
  # GET /sightings
  # GET /sightings.xml
  def index
#    @sightings = Sighting.all :order => "sighting_date DESC"
    @sightings = []
    me = Birder.find_by_id(session[:birder_id])
    @birders = me.followees
    @birders = [me] + @birders
    @birders.each do |birder|
      @sightings += birder.sightings
    end
    @sightings = @sightings.sort_by {|s| (s.sighting_date) }
    @sightings.reverse!

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sightings }
    end
  end

  # GET /sightings/my
  # GET /sightings/my.xml
  def my
    @sightings = Sighting.find_all_by_birder_id(session[:birder_id], :order => "sighting_date DESC")

    respond_to do |format|
      format.html # my.html.erb
      format.xml  { render :xml => @sightings }
    end
  end

  # GET /sightings/1
  # GET /sightings/1.xml
  def show
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sighting }
    end
  end

  # GET /sightings/new
  # GET /sightings/new.xml
  def new
    @sighting = Sighting.new
    @sighting.bird_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sighting }
    end
  end

  # GET /sightings/1/edit
  def edit
    @sighting = Sighting.find(params[:id])
  end

  def comment
    @sighting = Sighting.find(params[:id])
  end

  # POST /sightings
  # POST /sightings.xml
  def create
    @sighting = Sighting.new(params[:sighting])
    @sighting.birder_id = session[:birder_id]

    respond_to do |format|
      if @sighting.save
        flash[:notice] = 'Sighting was successfully created.'
        format.html { redirect_to "/sightings/my/x" }
        format.xml  { render :xml => @sighting, :status => :created, :location => @sighting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sighting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sightings/1
  # PUT /sightings/1.xml
  def update
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      if @sighting.update_attributes(params[:sighting])
        flash[:notice] = 'Sighting was successfully updated.'
        format.html { redirect_to "/sightings/my/x" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sighting.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /sightings/1
  # DELETE /sightings/1.xml
  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy

    respond_to do |format|
        format.html { redirect_to "/sightings/my/x" }
      format.xml  { head :ok }
    end
  end
end

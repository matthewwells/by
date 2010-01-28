require 'set'
class BirdersController < ApplicationController
  # GET /birders
  # GET /birders.xml
  def index
    me = Birder.find_by_id(session[:birder_id])
    @birders = me.followees
    @birders = [me] + @birders
#    birds = Bird.all
#    @total_species = 0;
#    birds.each do |bird|
#    	@total_species += 1 if bird.sightings.size > 0
#	  end
    all_species  = []
    @birders.each do |birder|
      all_species += birder.birds;
    end
    @total_species = all_species.to_set.size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @birders }
    end
  end

  # GET /birders/1
  # GET /birders/1.xml
  def show
    @birder = Birder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @birder }
    end
  end

  # GET /birders/new
  # GET /birders/new.xml
  def new
    @birder = Birder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @birder }
    end
  end

  # GET /birders/1/edit
  def edit
    @birder = Birder.find(params[:id])
  end

  # POST /birders
  # POST /birders.xml
  def create
    @birder = Birder.new(params[:birder])

    respond_to do |format|
      if @birder.save
        flash[:notice] = 'Birder was successfully created.'
        format.html { redirect_to(@birder) }
        format.xml  { render :xml => @birder, :status => :created, :location => @birder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @birder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /birders/1
  # PUT /birders/1.xml
  def update
    @birder = Birder.find(params[:id])

    respond_to do |format|
      if @birder.update_attributes(params[:birder])
        flash[:notice] = 'Birder was successfully updated.'
        format.html { redirect_to(@birder) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @birder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /birders/1
  # DELETE /birders/1.xml
  def destroy
    @birder = Birder.find(params[:id])
    @birder.destroy

    respond_to do |format|
      format.html { redirect_to(birders_url) }
      format.xml  { head :ok }
    end
  end
end

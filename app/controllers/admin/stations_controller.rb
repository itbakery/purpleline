class Admin::StationsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  # GET /stations
  # GET /stations.xml
  def index
  	page = params[:page] || 1  	
    @stations = Station.paginate :page => page, :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.xml
  def show
    @station = Station.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.xml
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
  end

  # POST /stations
  # POST /stations.xml
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        format.html { redirect_to([:admin,@station], :notice => 'Station was successfully created.') }
        format.xml  { render :xml => @station, :status => :created, :location => @station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.xml
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to([:admin,@station], :notice => 'Station was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.xml
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to(admin_stations_url) }
      format.xml  { head :ok }
    end
  end
end

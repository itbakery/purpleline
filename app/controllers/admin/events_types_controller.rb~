class Admin::EventsTypesController < ApplicationController
	layout "admin"
  # GET /events_types
  # GET /events_types.xml
  def index
    @events_types = EventsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events_types }
    end
  end

  # GET /events_types/1
  # GET /events_types/1.xml
  def show
    @events_type = EventsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @events_type }
    end
  end

  # GET /events_types/new
  # GET /events_types/new.xml
  def new
    @events_type = EventsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @events_type }
    end
  end

  # GET /events_types/1/edit
  def edit
    @events_type = EventsType.find(params[:id])
  end

  # POST /events_types
  # POST /events_types.xml
  def create
    @events_type = EventsType.new(params[:events_type])

    respond_to do |format|
      if @events_type.save
        format.html { redirect_to([:admin,@events_type], :notice => 'Events type was successfully created.') }
        format.xml  { render :xml => @events_type, :status => :created, :location => @events_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @events_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events_types/1
  # PUT /events_types/1.xml
  def update
    @events_type = EventsType.find(params[:id])

    respond_to do |format|
      if @events_type.update_attributes(params[:events_type])
        format.html { redirect_to([:admin,@events_type], :notice => 'Events type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @events_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events_types/1
  # DELETE /events_types/1.xml
  def destroy
    @events_type = EventsType.find(params[:id])
    @events_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_types_url) }
      format.xml  { head :ok }
    end
  end
end

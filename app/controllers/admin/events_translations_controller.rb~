class Admin::EventsTranslationsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!	
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper	
  # GET /events_translations
  # GET /events_translations.xml
  def index
  	page = params[:page] || 1  	
    @events_translations = EventsTranslation.paginate :page => page, :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events_translations }
    end
  end

  # GET /events_translations/1
  # GET /events_translations/1.xml
  def show
    @events_translation = EventsTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @events_translation }
    end
  end

  # GET /events_translations/new
  # GET /events_translations/new.xml
  def new
    @events_translation = EventsTranslation.new
    3.times do 
    	@events_translation.images.build
    end
    coordinates = [13.83333,100.522413]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)
    @gmarker = GMarker.new(coordinates,:title => "Drag to Select Station", :info_window => "Drag to Select", :draggable => true)
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)

    @map.event_init(@gmarker, :dragend, "function(){
      var latlng = gmarker.getLatLng().toUrlValue();
      var tmp = latlng.split(',');
      var px = tmp[0];
      var py = tmp[1];
      jQuery('#events_translation_latitude').val(px);
      jQuery('#events_translation_longtitude').val(py);
       }")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @events_translation }
    end
  end

  # GET /events_translations/1/edit
  def edit
    @events_translation = EventsTranslation.find(params[:id])
    coordinates = [@events_translation.latitude,@events_translation.longtitude]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)
    @gmarker = GMarker.new(coordinates,:title => "Drag to Select Station", :info_window => "Drag to Select", :draggable => true)
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)

    @map.event_init(@gmarker, :dragend, "function(){
      var latlng = gmarker.getLatLng().toUrlValue();
      var tmp = latlng.split(',');
      var px = tmp[0];
      var py = tmp[1];
      jQuery('#events_translation_latitude').val(px);
      jQuery('#events_translation_longtitude').val(py);
       }")  
  end

  # POST /events_translations
  # POST /events_translations.xml
  def create
    @events_translation = EventsTranslation.new(params[:events_translation])

    respond_to do |format|
      if @events_translation.save
        format.html { redirect_to([:admin,@events_translation], :notice => 'Events translation was successfully created.') }
        format.xml  { render :xml => @events_translation, :status => :created, :location => @events_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @events_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events_translations/1
  # PUT /events_translations/1.xml
  def update
    @events_translation = EventsTranslation.find(params[:id])

    respond_to do |format|
      if @events_translation.update_attributes(params[:events_translation])
        format.html { redirect_to([:admin,@events_translation], :notice => 'Events translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @events_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events_translations/1
  # DELETE /events_translations/1.xml
  def destroy
    @events_translation = EventsTranslation.find(params[:id])
    @events_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_translations_url) }
      format.xml  { head :ok }
    end
  end
end

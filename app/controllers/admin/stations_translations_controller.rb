class Admin::StationsTranslationsController < ApplicationController
  layout "admin"
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper

  # GET /stations_translations
  # GET /stations_translations.xml
  def index
    @stations_translations = StationsTranslation.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations_translations }
    end
  end

  def info
   render :update  do |page|
      page.alert("#{params[:latitude]},#{params[:longitude]}")
   end
  end

  # GET /stations_translations/1
  # GET /stations_translations/1.xml
  def show
    @stations_translation = StationsTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stations_translation }
    end
  end

  # GET /stations_translations/new
  # GET /stations_translations/new.xml
  def new
    @stations_translation = StationsTranslation.new

    coordinates = [41.8921254,-87.6096669]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,14)
    @gmarker = GMarker.new(coordinates,:title => "Navy Pier", :info_window => "Navy Pier", :draggable => true)
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
    #watch_this = remote_function(:url => {:controller =>:stations_translations, :action => :new, :latitude => "lat_ph", :longitude => "lng_ph" } )

    #watch_this[/lat_ph/] = "'+px+'"
    #watch_this[/lng_ph/] = "'+py+'"

    @map.event_init(@gmarker, :dragend, "function(){
      var latlng = gmarker.getLatLng().toUrlValue();
      var tmp = latlng.split(',');
      var px = tmp[0];
      var py = tmp[1];
      $('stations_translation_latitude').val(px);
      $('stations_translation_longtitude').val(py);
       }")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stations_translation }
    end
  end

  # GET /stations_translations/1/edit
  def edit
    @stations_translation = StationsTranslation.find(params[:id])
  end

  # POST /stations_translations
  # POST /stations_translations.xml
  def create
    @stations_translation = StationsTranslation.new(params[:stations_translation])

    respond_to do |format|
      if @stations_translation.save
        format.html { redirect_to([:admin,@stations_translation], :notice => 'Stations translation was successfully created.') }
        format.xml  { render :xml => @stations_translation, :status => :created, :location => @stations_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stations_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stations_translations/1
  # PUT /stations_translations/1.xml
  def update
    @stations_translation = StationsTranslation.find(params[:id])

    respond_to do |format|
      if @stations_translation.update_attributes(params[:stations_translation])
        format.html { redirect_to([:admin,@stations_translation], :notice => 'Stations translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stations_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stations_translations/1
  # DELETE /stations_translations/1.xml
  def destroy
    @stations_translation = StationsTranslation.find(params[:id])
    @stations_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_stations_translations_url) }
      format.xml  { head :ok }
    end
  end
end

class Admin::TasksTranslationsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!  
  #include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper

  # GET /tasks_translations
  # GET /tasks_translations.xml
  def index
  	page = params[:page] || 1

    @tasks_translations = TasksTranslation.paginate :page => page, :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks_translations }
    end
  end

  # GET /tasks_translations/1
  # GET /tasks_translations/1.xml
  def show
    @tasks_translation = TasksTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tasks_translation }
    end
  end

  # GET /tasks_translations/new
  # GET /tasks_translations/new.xml
  def new
    @tasks_translation = TasksTranslation.new
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
      jQuery('#tasks_translation_latitude').val(px);
      jQuery('#tasks_translation_longtitude').val(py);
       }")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tasks_translation }
    end
  end

  # GET /tasks_translations/1/edit
  def edit
    @tasks_translation = TasksTranslation.find(params[:id])
    coordinates = [@tasks_translation.latitude,@tasks_translation.longtitude]
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
      jQuery('#tasks_translation_latitude').val(px);
      jQuery('#tasks_translation_longtitude').val(py);
       }")    
  end

  # POST /tasks_translations
  # POST /tasks_translations.xml
  def create
    @tasks_translation = TasksTranslation.new(params[:tasks_translation])

    respond_to do |format|
      if @tasks_translation.save
        format.html { redirect_to([:admin,@tasks_translation], :notice => 'Tasks translation was successfully created.') }
        format.xml  { render :xml => @tasks_translation, :status => :created, :location => @tasks_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasks_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks_translations/1
  # PUT /tasks_translations/1.xml
  def update
    @tasks_translation = TasksTranslation.find(params[:id])

    respond_to do |format|
      if @tasks_translation.update_attributes(params[:tasks_translation])
        format.html { redirect_to([:admin,@tasks_translation], :notice => 'Tasks translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tasks_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks_translations/1
  # DELETE /tasks_translations/1.xml
  def destroy
    @tasks_translation = TasksTranslation.find(params[:id])
    @tasks_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tasks_translations_url) }
      format.xml  { head :ok }
    end
  end
end

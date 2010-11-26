class Admin::PagesTranslationsController < ApplicationController
	layout  "admin"
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  # GET /pages_translations
  # GET /pages_translations.xml
  def index
  	page = params[:page] || 1

    @pages_translations = PagesTranslation.paginate :page => page, :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages_translations }
    end
  end

  # GET /pages_translations/1
  # GET /pages_translations/1.xml
  def show
    @pages_translation = PagesTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pages_translation }
    end
  end

  # GET /pages_translations/new
  # GET /pages_translations/new.xml
  def new
    @pages_translation = PagesTranslation.new
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
      $('#announces_translation_latitude').val(px);
      $('#announces_translation_longtitude').val(py);
       }")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pages_translation }
    end
  end

  # GET /pages_translations/1/edit
  def edit
    @pages_translation = PagesTranslation.find(params[:id])
  end

  # POST /pages_translations
  # POST /pages_translations.xml
  def create
    @pages_translation = PagesTranslation.new(params[:pages_translation])

    respond_to do |format|
      if @pages_translation.save
        format.html { redirect_to([:admin,@pages_translation], :notice => 'Pages translation was successfully created.') }
        format.xml  { render :xml => @pages_translation, :status => :created, :location => @pages_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pages_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages_translations/1
  # PUT /pages_translations/1.xml
  def update
    @pages_translation = PagesTranslation.find(params[:id])

    respond_to do |format|
      if @pages_translation.update_attributes(params[:pages_translation])
        format.html { redirect_to([:admin,@pages_translation], :notice => 'Pages translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pages_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages_translations/1
  # DELETE /pages_translations/1.xml
  def destroy
    @pages_translation = PagesTranslation.find(params[:id])
    @pages_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pages_translations_url) }
      format.xml  { head :ok }
    end
  end
end

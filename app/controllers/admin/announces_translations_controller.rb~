class Admin::AnnouncesTranslationsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  # GET /announces_translations
  # GET /announces_translations.xml
  def index
  	page = params[:page] || 1

    @announces_translations = AnnouncesTranslation.paginate :page => page, :order => 'created_at DESC' rescue nil

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @announces_translations }
    end
  end

  # GET /announces_translations/1
  # GET /announces_translations/1.xml
  def show
    @announces_translation = AnnouncesTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @announces_translation }
    end
  end

  # GET /announces_translations/new
  # GET /announces_translations/new.xml
  def new
    @announces_translation = AnnouncesTranslation.new
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
      format.xml  { render :xml => @announces_translation }
    end
  end

  # GET /announces_translations/1/edit
  def edit
    @announces_translation = AnnouncesTranslation.find(params[:id])
  end

  # POST /announces_translations
  # POST /announces_translations.xml
  def create
    @announces_translation = AnnouncesTranslation.new(params[:announces_translation])

    respond_to do |format|
      if @announces_translation.save
        format.html { redirect_to([:admin,@announces_translation], :notice => 'Announces translation was successfully created.') }
        format.xml  { render :xml => @announces_translation, :status => :created, :location => @announces_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @announces_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /announces_translations/1
  # PUT /announces_translations/1.xml
  def update
    @announces_translation = AnnouncesTranslation.find(params[:id])

    respond_to do |format|
      if @announces_translation.update_attributes(params[:announces_translation])
        format.html { redirect_to([:admin,@announces_translation], :notice => 'Announces translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @announces_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /announces_translations/1
  # DELETE /announces_translations/1.xml
  def destroy
    @announces_translation = AnnouncesTranslation.find(params[:id])
    @announces_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_announces_translations_url) }
      format.xml  { head :ok }
    end
  end
end

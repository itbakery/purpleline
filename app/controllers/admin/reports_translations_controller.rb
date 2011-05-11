class Admin::ReportsTranslationsController < ApplicationController
 layout "admin"
  # GET /reports_translations
  # GET /reports_translations.xml
  def index
    page = params[:page] || 1
    @reports_translations = ReportsTranslation.paginate :page => page, :order => 'created_at DESC' rescue nil

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports_translations }
    end
  end

  # GET /reports_translations/1
  # GET /reports_translations/1.xml
  def show
    @reports_translation = ReportsTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reports_translation }
    end
  end

  # GET /reports_translations/new
  # GET /reports_translations/new.xml
  def new
    @reports_translation = ReportsTranslation.new
    3.times do 
    	@reports_translation.images.build
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
      jQuery('#announces_translation_latitude').val(px);
      jQuery('#announces_translation_longtitude').val(py);
       }")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reports_translation }
    end
  end

  # GET /reports_translations/1/edit
  def edit
    @reports_translation = ReportsTranslation.find(params[:id])
  end

  # POST /reports_translations
  # POST /reports_translations.xml
  def create
    @reports_translation = ReportsTranslation.new(params[:reports_translation])

    respond_to do |format|
      if @reports_translation.save
        format.html { redirect_to([:admin,@reports_translation], :notice => 'Reports translation was successfully created.') }
        format.xml  { render :xml => @reports_translation, :status => :created, :location => @reports_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reports_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports_translations/1
  # PUT /reports_translations/1.xml
  def update
    @reports_translation = ReportsTranslation.find(params[:id])

    respond_to do |format|
      if @reports_translation.update_attributes(params[:reports_translation])
        format.html { redirect_to([:admin,@reports_translation], :notice => 'Reports translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reports_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports_translations/1
  # DELETE /reports_translations/1.xml
  def destroy
    @reports_translation = ReportsTranslation.find(params[:id])
    @reports_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_reports_translations_url) }
      format.xml  { head :ok }
    end
  end
end

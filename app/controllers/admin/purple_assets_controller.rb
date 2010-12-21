class Admin::PurpleAssetsController < ApplicationController
	layout "admin"
  before_filter :authenticate_user!
  # GET /purple_assets
  # GET /purple_assets.xml
  def index
  	page = params[:page] || 1  	
    @purple_assets = PurpleAsset.paginate :page => page, :order => 'created_at DESC'
    @attachable = find_attachable
    @assets = @attachable.purple_assets
    #map
    
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
      jQuery('#purple_asset_latitude').val(px);
      jQuery('#purple_asset_longtitude').val(py);
       }")
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purple_assets }
    end
  end

  # GET /purple_assets/1
  # GET /purple_assets/1.xml
  def show
    @purple_asset = PurpleAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purple_asset }
    end
  end

  # GET /purple_assets/new
  # GET /purple_assets/new.xml
  def new
    @purple_asset = PurpleAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purple_asset }
    end
  end

  # GET /purple_assets/1/edit
  def edit
    @purple_asset = PurpleAsset.find(params[:id])
  end

  # POST /purple_assets
  # POST /purple_assets.xml
  def create
  	@attachable = find_attachable
    #@purple_asset = PurpleAsset.new(params[:purple_asset])
    @purple_asset = @attachable.purple_assets.build(params[:purple_asset])

    respond_to do |format|
      if @purple_asset.save
        #format.html { redirect_to([:admin,@purple_asset], :notice => 'Purple asset was successfully created.') }
        format.html {redirect_to([:admin,@attachable,:purple_assets]) }
        format.xml  { render :xml => @purple_asset, :status => :created, :location => @purple_asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purple_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purple_assets/1
  # PUT /purple_assets/1.xml
  def update
    @purple_asset = PurpleAsset.find(params[:id])

    respond_to do |format|
      if @purple_asset.update_attributes(params[:purple_asset])
        format.html { redirect_to([:admin,@purple_asset], :notice => 'Purple asset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purple_asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purple_assets/1
  # DELETE /purple_assets/1.xml
  def destroy
    @purple_asset = PurpleAsset.find(params[:id])
    @purple_asset.destroy

    respond_to do |format|
      format.html { redirect_to(admin_purple_assets_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def find_attachable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end


end

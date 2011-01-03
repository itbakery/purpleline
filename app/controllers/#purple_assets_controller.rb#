class PurpleAssetsController < ApplicationController
  # GET /purple_assets
  # GET /purple_assets.xml
  def index
    @purple_assets = PurpleAsset.all

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
    @purple_asset = PurpleAsset.new(params[:purple_asset])

    respond_to do |format|
      if @purple_asset.save
        format.html { redirect_to(@purple_asset, :notice => 'Purple asset was successfully created.') }
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
        format.html { redirect_to(@purple_asset, :notice => 'Purple asset was successfully updated.') }
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
      format.html { redirect_to(purple_assets_url) }
      format.xml  { head :ok }
    end
  end
end

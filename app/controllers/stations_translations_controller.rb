class StationsTranslationsController < ApplicationController
  # GET /stations_translations
  # GET /stations_translations.xml
  def index
    @stations_translations = StationsTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations_translations }
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
        format.html { redirect_to(@stations_translation, :notice => 'Stations translation was successfully created.') }
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
        format.html { redirect_to(@stations_translation, :notice => 'Stations translation was successfully updated.') }
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
      format.html { redirect_to(stations_translations_url) }
      format.xml  { head :ok }
    end
  end
end

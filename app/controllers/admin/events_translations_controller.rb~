class Admin::EventsTranslationsController < ApplicationController
	layout "admin"
  # GET /events_translations
  # GET /events_translations.xml
  def index
    @events_translations = EventsTranslation.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @events_translation }
    end
  end

  # GET /events_translations/1/edit
  def edit
    @events_translation = EventsTranslation.find(params[:id])
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

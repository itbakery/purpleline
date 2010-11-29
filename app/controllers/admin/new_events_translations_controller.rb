class Admin::NewEventsTranslationsController < ApplicationController
	layout "admin"
  before_filter :authenticate_user!
  # GET /new_events_translations
  # GET /new_events_translations.xml
  def index
  	page = params[:page] || 1
    @new_events_translations = NewEventsTranslation.paginate :page => page, :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @new_events_translations }
    end
  end

  # GET /new_events_translations/1
  # GET /new_events_translations/1.xml
  def show
    @new_events_translation = NewEventsTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @new_events_translation }
    end
  end

  # GET /new_events_translations/new
  # GET /new_events_translations/new.xml
  def new
    @new_events_translation = NewEventsTranslation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_events_translation }
    end
  end

  # GET /new_events_translations/1/edit
  def edit
    @new_events_translation = NewEventsTranslation.find(params[:id])
  end

  # POST /new_events_translations
  # POST /new_events_translations.xml
  def create
    @new_events_translation = NewEventsTranslation.new(params[:new_events_translation])

    respond_to do |format|
      if @new_events_translation.save
        format.html { redirect_to([:admin,@new_events_translation], :notice => 'New events translation was successfully created.') }
        format.xml  { render :xml => @new_events_translation, :status => :created, :location => @new_events_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_events_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /new_events_translations/1
  # PUT /new_events_translations/1.xml
  def update
    @new_events_translation = NewEventsTranslation.find(params[:id])

    respond_to do |format|
      if @new_events_translation.update_attributes(params[:new_events_translation])
        format.html { redirect_to([:admin,@new_events_translation], :notice => 'New events translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @new_events_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /new_events_translations/1
  # DELETE /new_events_translations/1.xml
  def destroy
    @new_events_translation = NewEventsTranslation.find(params[:id])
    @new_events_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_new_events_translations_url) }
      format.xml  { head :ok }
    end
  end
end

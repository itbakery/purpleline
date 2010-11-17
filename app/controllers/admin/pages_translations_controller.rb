class Admin::PagesTranslationsController < ApplicationController
	layout  "admin"
  # GET /pages_translations
  # GET /pages_translations.xml
  def index
    @pages_translations = PagesTranslation.all

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

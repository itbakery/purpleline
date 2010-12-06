class NewslettersTranslationsController < ApplicationController
  # GET /newsletters_translations
  # GET /newsletters_translations.xml
  def index
    @newsletters_translations = NewslettersTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletters_translations }
    end
  end

  # GET /newsletters_translations/1
  # GET /newsletters_translations/1.xml
  def show
    @newsletters_translation = NewslettersTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletters_translation }
    end
  end

  # GET /newsletters_translations/new
  # GET /newsletters_translations/new.xml
  def new
    @newsletters_translation = NewslettersTranslation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletters_translation }
    end
  end

  # GET /newsletters_translations/1/edit
  def edit
    @newsletters_translation = NewslettersTranslation.find(params[:id])
  end

  # POST /newsletters_translations
  # POST /newsletters_translations.xml
  def create
    @newsletters_translation = NewslettersTranslation.new(params[:newsletters_translation])

    respond_to do |format|
      if @newsletters_translation.save
        format.html { redirect_to(@newsletters_translation, :notice => 'Newsletters translation was successfully created.') }
        format.xml  { render :xml => @newsletters_translation, :status => :created, :location => @newsletters_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletters_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsletters_translations/1
  # PUT /newsletters_translations/1.xml
  def update
    @newsletters_translation = NewslettersTranslation.find(params[:id])

    respond_to do |format|
      if @newsletters_translation.update_attributes(params[:newsletters_translation])
        format.html { redirect_to(@newsletters_translation, :notice => 'Newsletters translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletters_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters_translations/1
  # DELETE /newsletters_translations/1.xml
  def destroy
    @newsletters_translation = NewslettersTranslation.find(params[:id])
    @newsletters_translation.destroy

    respond_to do |format|
      format.html { redirect_to(newsletters_translations_url) }
      format.xml  { head :ok }
    end
  end
end

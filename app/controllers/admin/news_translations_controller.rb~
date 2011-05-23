class NewsTranslationsController < ApplicationController
  # GET /news_translations
  # GET /news_translations.xml
  def index
    @news_translations = NewsTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_translations }
    end
  end

  # GET /news_translations/1
  # GET /news_translations/1.xml
  def show
    @news_translation = NewsTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_translation }
    end
  end

  # GET /news_translations/new
  # GET /news_translations/new.xml
  def new
    @news_translation = NewsTranslation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_translation }
    end
  end

  # GET /news_translations/1/edit
  def edit
    @news_translation = NewsTranslation.find(params[:id])
  end

  # POST /news_translations
  # POST /news_translations.xml
  def create
    @news_translation = NewsTranslation.new(params[:news_translation])

    respond_to do |format|
      if @news_translation.save
        format.html { redirect_to(@news_translation, :notice => 'News translation was successfully created.') }
        format.xml  { render :xml => @news_translation, :status => :created, :location => @news_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_translations/1
  # PUT /news_translations/1.xml
  def update
    @news_translation = NewsTranslation.find(params[:id])

    respond_to do |format|
      if @news_translation.update_attributes(params[:news_translation])
        format.html { redirect_to(@news_translation, :notice => 'News translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_translations/1
  # DELETE /news_translations/1.xml
  def destroy
    @news_translation = NewsTranslation.find(params[:id])
    @news_translation.destroy

    respond_to do |format|
      format.html { redirect_to(news_translations_url) }
      format.xml  { head :ok }
    end
  end
end

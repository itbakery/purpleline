class AnnouncesTranslationsController < ApplicationController
  # GET /announces_translations
  # GET /announces_translations.xml
  def index
    @announces_translations = AnnouncesTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @announces_translations }
    end
  end
  
  def search
  	@announces_translations = AnnouncesTranslation
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
        format.html { redirect_to(@announces_translation, :notice => 'Announces translation was successfully created.') }
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
        format.html { redirect_to(@announces_translation, :notice => 'Announces translation was successfully updated.') }
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
      format.html { redirect_to(announces_translations_url) }
      format.xml  { head :ok }
    end
  end
end

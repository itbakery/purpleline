class Admin::TasksTranslationsController < ApplicationController
  layout "admin"
  # GET /tasks_translations
  # GET /tasks_translations.xml
  def index
    @tasks_translations = TasksTranslation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks_translations }
    end
  end

  # GET /tasks_translations/1
  # GET /tasks_translations/1.xml
  def show
    @tasks_translation = TasksTranslation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tasks_translation }
    end
  end

  # GET /tasks_translations/new
  # GET /tasks_translations/new.xml
  def new
    @tasks_translation = TasksTranslation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tasks_translation }
    end
  end

  # GET /tasks_translations/1/edit
  def edit
    @tasks_translation = TasksTranslation.find(params[:id])
  end

  # POST /tasks_translations
  # POST /tasks_translations.xml
  def create
    @tasks_translation = TasksTranslation.new(params[:tasks_translation])

    respond_to do |format|
      if @tasks_translation.save
        format.html { redirect_to([:admin,@tasks_translation], :notice => 'Tasks translation was successfully created.') }
        format.xml  { render :xml => @tasks_translation, :status => :created, :location => @tasks_translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasks_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks_translations/1
  # PUT /tasks_translations/1.xml
  def update
    @tasks_translation = TasksTranslation.find(params[:id])

    respond_to do |format|
      if @tasks_translation.update_attributes(params[:tasks_translation])
        format.html { redirect_to([:admin,@tasks_translation], :notice => 'Tasks translation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tasks_translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks_translations/1
  # DELETE /tasks_translations/1.xml
  def destroy
    @tasks_translation = TasksTranslation.find(params[:id])
    @tasks_translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tasks_translations_url) }
      format.xml  { head :ok }
    end
  end
end

class NewsTypesController < ApplicationController
  # GET /news_types
  # GET /news_types.xml
  def index
    @news_types = NewsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_types }
    end
  end

  # GET /news_types/1
  # GET /news_types/1.xml
  def show
    @news_type = NewsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_type }
    end
  end

  # GET /news_types/new
  # GET /news_types/new.xml
  def new
    @news_type = NewsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_type }
    end
  end

  # GET /news_types/1/edit
  def edit
    @news_type = NewsType.find(params[:id])
  end

  # POST /news_types
  # POST /news_types.xml
  def create
    @news_type = NewsType.new(params[:news_type])

    respond_to do |format|
      if @news_type.save
        format.html { redirect_to(@news_type, :notice => 'News type was successfully created.') }
        format.xml  { render :xml => @news_type, :status => :created, :location => @news_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_types/1
  # PUT /news_types/1.xml
  def update
    @news_type = NewsType.find(params[:id])

    respond_to do |format|
      if @news_type.update_attributes(params[:news_type])
        format.html { redirect_to(@news_type, :notice => 'News type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_types/1
  # DELETE /news_types/1.xml
  def destroy
    @news_type = NewsType.find(params[:id])
    @news_type.destroy

    respond_to do |format|
      format.html { redirect_to(news_types_url) }
      format.xml  { head :ok }
    end
  end
end

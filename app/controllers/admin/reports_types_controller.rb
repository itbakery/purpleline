class Admin::ReportsTypesController < ApplicationController
  layout "admin"
  # GET /reports_types
  # GET /reports_types.xml
  def index
    @reports_types = ReportsType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports_types }
    end
  end

  # GET /reports_types/1
  # GET /reports_types/1.xml
  def show
    @reports_type = ReportsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reports_type }
    end
  end

  # GET /reports_types/new
  # GET /reports_types/new.xml
  def new
    @reports_type = ReportsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reports_type }
    end
  end

  # GET /reports_types/1/edit
  def edit
    @reports_type = ReportsType.find(params[:id])
  end

  # POST /reports_types
  # POST /reports_types.xml
  def create
    @reports_type = ReportsType.new(params[:reports_type])

    respond_to do |format|
      if @reports_type.save
        format.html { redirect_to([:admin,@reports_type], :notice => 'Reports type was successfully created.') }
        format.xml  { render :xml => @reports_type, :status => :created, :location => @reports_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reports_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports_types/1
  # PUT /reports_types/1.xml
  def update
    @reports_type = ReportsType.find(params[:id])

    respond_to do |format|
      if @reports_type.update_attributes(params[:reports_type])
        format.html { redirect_to([:admin,@reports_type], :notice => 'Reports type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reports_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports_types/1
  # DELETE /reports_types/1.xml
  def destroy
    @reports_type = ReportsType.find(params[:id])
    @reports_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_reports_types_url) }
      format.xml  { head :ok }
    end
  end

end

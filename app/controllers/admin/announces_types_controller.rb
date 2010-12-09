class Admin::AnnouncesTypesController < ApplicationController
  layout "admin"
  before(:authenticate_user!)
  # GET /announces_types
  # GET /announces_types.xml
  def index
    @announces_types = AnnouncesType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @announces_types }
    end
  end

  # GET /announces_types/1
  # GET /announces_types/1.xml
  def show
    @announces_type = AnnouncesType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @announces_type }
    end
  end

  # GET /announces_types/new
  # GET /announces_types/new.xml
  def new
    @announces_type = AnnouncesType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @announces_type }
    end
  end

  # GET /announces_types/1/edit
  def edit
    @announces_type = AnnouncesType.find(params[:id])
  end

  # POST /announces_types
  # POST /announces_types.xml
  def create
    @announces_type = AnnouncesType.new(params[:announces_type])

    respond_to do |format|
      if @announces_type.save
        format.html { redirect_to([:admin,@announces_type], :notice => 'Announces type was successfully created.') }
        format.xml  { render :xml => @announces_type, :status => :created, :location => @announces_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @announces_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /announces_types/1
  # PUT /announces_types/1.xml
  def update
    @announces_type = AnnouncesType.find(params[:id])

    respond_to do |format|
      if @announces_type.update_attributes(params[:announces_type])
        format.html { redirect_to([:admin,@announces_type], :notice => 'Announces type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @announces_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /announces_types/1
  # DELETE /announces_types/1.xml
  def destroy
    @announces_type = AnnouncesType.find(params[:id])
    @announces_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_announces_types_url) }
      format.xml  { head :ok }
    end
  end
end

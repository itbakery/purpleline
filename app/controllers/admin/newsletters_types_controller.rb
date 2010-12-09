class Admin::NewslettersTypesController < ApplicationController
   layout "admin"
   before(:authenticate_user!)	
  # GET /newsletters_types
  # GET /newsletters_types.xml
  def index
    @newsletters_types = NewslettersType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletters_types }
    end
  end

  # GET /newsletters_types/1
  # GET /newsletters_types/1.xml
  def show
    @newsletters_type = NewslettersType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletters_type }
    end
  end

  # GET /newsletters_types/new
  # GET /newsletters_types/new.xml
  def new
    @newsletters_type = NewslettersType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletters_type }
    end
  end

  # GET /newsletters_types/1/edit
  def edit
    @newsletters_type = NewslettersType.find(params[:id])
  end

  # POST /newsletters_types
  # POST /newsletters_types.xml
  def create
    @newsletters_type = NewslettersType.new(params[:newsletters_type])

    respond_to do |format|
      if @newsletters_type.save
        format.html { redirect_to([:admin,@newsletters_type], :notice => 'Newsletters type was successfully created.') }
        format.xml  { render :xml => @newsletters_type, :status => :created, :location => @newsletters_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletters_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsletters_types/1
  # PUT /newsletters_types/1.xml
  def update
    @newsletters_type = NewslettersType.find(params[:id])

    respond_to do |format|
      if @newsletters_type.update_attributes(params[:newsletters_type])
        format.html { redirect_to([:admin,@newsletters_type], :notice => 'Newsletters type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletters_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters_types/1
  # DELETE /newsletters_types/1.xml
  def destroy
    @newsletters_type = NewslettersType.find(params[:id])
    @newsletters_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_newsletters_types_url) }
      format.xml  { head :ok }
    end
  end
end

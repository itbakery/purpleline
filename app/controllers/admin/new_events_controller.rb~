class NewEventsController < ApplicationController
  # GET /new_events
  # GET /new_events.xml
  def index
    @new_events = NewEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @new_events }
    end
  end

  # GET /new_events/1
  # GET /new_events/1.xml
  def show
    @new_event = NewEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @new_event }
    end
  end

  # GET /new_events/new
  # GET /new_events/new.xml
  def new
    @new_event = NewEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_event }
    end
  end

  # GET /new_events/1/edit
  def edit
    @new_event = NewEvent.find(params[:id])
  end

  # POST /new_events
  # POST /new_events.xml
  def create
    @new_event = NewEvent.new(params[:new_event])

    respond_to do |format|
      if @new_event.save
        format.html { redirect_to(@new_event, :notice => 'New event was successfully created.') }
        format.xml  { render :xml => @new_event, :status => :created, :location => @new_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /new_events/1
  # PUT /new_events/1.xml
  def update
    @new_event = NewEvent.find(params[:id])

    respond_to do |format|
      if @new_event.update_attributes(params[:new_event])
        format.html { redirect_to(@new_event, :notice => 'New event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @new_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /new_events/1
  # DELETE /new_events/1.xml
  def destroy
    @new_event = NewEvent.find(params[:id])
    @new_event.destroy

    respond_to do |format|
      format.html { redirect_to(new_events_url) }
      format.xml  { head :ok }
    end
  end
end

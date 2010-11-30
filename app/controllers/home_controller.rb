class HomeController < ApplicationController
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  def index
  	@newevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	render :layout=>"home"
  end
 
  def newevent
#  	if params[:id]
#  		@newevents = NewEventsTranslation.where("id=?",params[:id]).where("publish =?",1)
#  	else
#  		@newevents = NewEventsTranslation.order("start_on desc")
#  	end
#  	  @allnewevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc")
#  	  @lasttennewevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(10)
#  	render :layout=>"newevent"
  	
  	
  	if params[:id]
  		@newevents = AnnouncesTranslation.where("id=?",params[:id]).where("publish =?",1)
  		
  		coordinates = @newevents.first.latitude,@newevents.first.longtitude]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)	
    @gmarker = GMarker.new(coordinates,:title => "#{@newevents.first.title}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
  	else
  		@newevents = AnnouncesTranslation.order("start_on desc")
  	end
  	  @allnewevents = Announceslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc")
  	  @lasttennewevents = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(10)
  	render :layout=>"newevent"
  	
  end
  def present
       render  :layout => "present"
  end

  def mrta
  	@mrta = PagesTranslation.find(1)  rescue nil
  	render :layout=>"mrta"
  end
  
  def project
  	render :layout=>"project"
  end
  
  def pcpl
  end
  
  def station
  	@station = StationsTranslation.find(params[:id])
    coordinates = [@station.latitude,@station.longtitude]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)	
    @gmarker = GMarker.new(coordinates,:title => "#{@station.title}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
  	render :layout=>"project"
  end
  
  def pagetran
  	@page = PagesTranslation.find(params[:id])
  	render :layout=>"mrta"
  end
end

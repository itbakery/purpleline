class HomeController < ApplicationController
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  def index
  	#@newevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
    @stations = StationsTranslation.all
  	render :layout=>"home"
  end
 
  def announcement  	
  	if params[:id]
  	@announces = AnnouncesTranslation.where("id=?",params[:id]).where("publish =?",1)
  	coordinates = [@announces.first.latitude,@announces.first.longtitude]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)	
    @gmarker = GMarker.new(coordinates,:title => "#{@announces.first.title}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
  	else
  		@announces = AnnouncesTranslation.order("start_on desc")
  	end
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc")
  	  @lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(10)
  	  render :layout=>"announce"
  	
  end
  def present
       render  :layout => "present"
  end

  def mrta
  	@mrta = PagesTranslation.find(1)  rescue nil
  	render :layout=>"mrta"
  end
  
  def pageview
  	@page =  PagesTranslation.where("id=?",params[:id])
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
  def progress
  	@progresses = Progress.all
    @h = HighChart.new('graph') do |f|
      f.title({ :text=>"Progress Report  MRTA Purple Line Project : BANG YAI - BANG SUE SECTION "})
      f.subtitle({:text => "Source from: PCPL "})
      f.legend({:layout=>"vertical",:align=>"right",:verticalAlign=> "top",:borderWidth =>'top',:style=>{:position=>'absolute', :bottom=>'auto', :left=>'0px', :top=>'20px'}})
      f.options[:x_axis][:categories] = @progresses.map(&:month)
      f.options[:x_axis][:labels] = {:rotation=>-90 , :align => 'right'}
      #f.options[:x_axis][:title] = {:text=> "Months"}
      f.options[:y_axis][:title] = {:text=> "Project Progress (%)"}
      f.series(:type=> 'line',:name=> 'Schedule',:data=>  @progresses.map(&:schedule))
      f.series(:type=> 'line',:name=> 'Actual',:data=>  @progresses.map(&:actual))
    end
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)

  	render :layout=>"progress"
  end
  def filterstation
	  @map = GMap.new("map_div")
	  @map.control_init(:large_map => true,:map_type => true)
	  @map.center_zoom_init([75.5,-42.56],4)
	  @map.overlay_init(GMarker.new([75.6,-42.467],:title => "Hello", :info_window => "Info! Info!"))
  	
  	respond_to do |format|
      format.html  {render :layout=>"project"}
      format.js  
    end
  end
  
include  Geokit::Geocoders
include  Geokit::Mappable
  
  def fullmap
  	@userip = request.env['REMOTE_ADDR']
  	
  	
  	userlocation = IpGeocoder.geocode('@userip')
  	markers = Array.new()
    
  	if userlocation.success
  		lat = userlocation.lat
  		lng = userlocatlat.lng
  		markers << GMarker.new([lat,lng],:title=>"You are here") 
  	end
  	
    coordinates = [13.8705,100.479]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,13)	
    @stations = StationsTranslation.all
    markers = Array.new()
    markers << GMarker.new([lat,lng],:title=>"You are here")    
    @Icon=GIcon.new(:image=> "./images/purple_marker.png",
    	      					:iconSize =>GSize.new(32,32),
    	      					:iconAnchor =>GPoint.new(16,16),
    	      					:infoWindowAnchor=> GPoint.new(25,7))

    @stations.each_with_index do |station,index|
    	coordinate = [station.latitude,station.longtitude]
    	markers << GMarker.new(coordinate,
    												:title=>"#{station.code} #{station.title}",
    												:info_window =>"<p class='badge-small'>#{station.code}</p> #{station.title}",
    												:icon=>@Icon)
    end
    markers.each do |m|
    	@map.overlay_init(m)
    end

    
    
  	render :layout => "fullmap"
  end
  
  	
end

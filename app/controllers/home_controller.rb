class HomeController < ApplicationController
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  
  def index
  	session[:lang] = params[:lang] || "th"
  	#@newevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"  	
  	
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"  

  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"   	
  	
    @stations = StationsTranslation.all
    @userip = request.env['REMOTE_ADDR']
    @member = Member.new
    coordinates = [13.83333,100.522413]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)
    @gmarker = GMarker.new(coordinates,:title => "Drag to Select Station", :info_window => "Drag to Select", :draggable => true)
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)

    @map.event_init(@gmarker, :dragend, "function(){
      var latlng = gmarker.getLatLng().toUrlValue();
      var tmp = latlng.split(',');
      var px = tmp[0];
      var py = tmp[1];
      jQuery('#member_latitude').val(px);
      jQuery('#member_longtitude').val(py);
       }")
    
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
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allannounces_month = @allannounces.group_by { |t| t.start_on.beginning_of_month}
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
 	  render :layout=>"announce"
  end
  
  def showevent  	
  	if params[:id]
  		@events = EventsTranslation.where("id=?",params[:id]).where("publish =?",1)
  	coordinates = [@events.first.latitude,@events.first.longtitude]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)	
    @gmarker = GMarker.new(coordinates,:title => "#{@events.first.title}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
  	else
  		@events = EventsTranslation.order("start_on desc")
  	end
  	@allevents = EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allevents = EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allevents_month = @allevents.group_by { |t| t.start_on.beginning_of_month}
  	@lasttenevents = EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttenevents = EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
 	  render :layout=>"event"
  end
  
  def shownews  	
  	if params[:id]
  	@newletters = NewslettersTranslation.where("id=?",params[:id]).where("publish =?",1)
  	unless @newletters.first.latitude.blank?
				coordinates = [@newletters.first.latitude,@newletters.first.longtitude]
				@map = GMap.new("map")
				@map.control_init(:large_map => true, :map_type => true)
				@map.center_zoom_init(coordinates,15)	
				@gmarker = GMarker.new(coordinates,:title => "#{@newletters.first.title}")
				@map.overlay_global_init(@gmarker, "gmarker")
				@map.overlay_init(@gmarker)
				end

  	else
  		@newletters = NewslettersTranslation.order("start_on desc")
  	end
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allnewletters_month = @allnewletters.group_by { |t| t.start_on.beginning_of_month}
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
 	  render :layout=>"newsletters"
  end
  
  def allannounce
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  end
  
  def lasttenannounce
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
  end
  
  def monthlyannounce
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allannounces_month = @allannounces.group_by { |t| t.start_on.beginning_of_month}

  end
  
  
  def  allnew
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  end
  
  def lasttennew
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
  	
  end
  
  def monthlynew
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allnewletters_month = @allnewletters.group_by { |t| t.start_on.beginning_of_month}
  end
  
  
  def allstation
  	@stations=StationsTranslation.where("language_id=?",1) if session[:lang]=="th"
  	@stations=StationsTranslation.where("language_id=?",2) if session[:lang]=="en"
  	render :layout =>"project"
  end
    
  def event
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"  
  end
  
  def  newletter
  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"    	
  end
  
  
  def present
       render  :layout => "present"
  end

  def mrta
  	@mrta = PagesTranslation.find(1)  rescue nil
  	render :layout=>"mrta"
  end
  
  def pageview
  	  @page =  PagesTranslation.where("id=?",params[:id]) rescue nil
  	if params[:p]=="link"
  	  render :layout=>"link"	
  	elsif params[:p]=="qa"
  	  render :layout=>"qa"
  	else	
  	  render :layout=>"project"
        end
  end
  
  def mrtaview
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
  
  def faceboxmap
  	@station = StationsTranslation.find(params[:id])
    coordinates = [@station.latitude,@station.longtitude]
    @map = GMap.new("faceboxmap")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,17)	
    @gmarker = GMarker.new(coordinates,:title => "#{@station.title}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
    respond_to do |format|
      format.html  {render :layout=>"faceboxmap"}
      format.js  {render :layout=>"faceboxmap"}
    end
    
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
      f.options[:y_axis]={:startOnTick => false,:min=>0,:max=>100}
      f.options[:y_axis][:title] = {:text=> "Project Progress (%)"}
      f.series(:type=> 'line',:name=> 'Schedule',:data=>  @progresses.map(&:schedule))
      f.series(:type=> 'line',:name=> 'Actual',:data=>  @progresses.map(&:actual))
    end
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"  

  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(5) if session[:lang]=="th"
  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(5) if session[:lang]=="en"   	

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
  	
  	
  	@userlocation = IpGeocoder.geocode("#{@userip}")
  	markers = Array.new()
    
    if @userlocation.lat.nil?
  		lat = @userlocation.lat
  		lng = @userlocation.lng
  		markers << GMarker.new([lat,lng],:title=>"You are here",:info_window=>"#{lat}  #{lng}") 
  	end
  	
    coordinates = [13.8705,100.479]
    @map = GMap.new("fullmap")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,13)	
    @stations = StationsTranslation.all
    markers = Array.new()
   
    @Icon=GIcon.new(:image=> "./images/purple_marker.png",
    	      					:iconSize =>GSize.new(32,32),
    	      					:iconAnchor =>GPoint.new(16,16),
    	      					:infoWindowAnchor=> GPoint.new(25,7))

    @stations.each_with_index do |station,index|
    	coordinate = [station.latitude,station.longtitude]
    	markers << GMarker.new(coordinate,
    	                    	{:title=>"#{station.code} #{station.title}",
    												:info_window =>"<p class='badge-small'>#{station.code}</p> #{station.title}",
    		                    :icon=>@Icon})
    end
    
    
    markers.each do |m|
    	@map.overlay_init(m)
    end
  	respond_to do |format|
      format.html   {render :layout=>"fullmap"}
    end
  end
  def mastermap
  	render :layout => "fullmap"
  end
  
  def setlang
  	session[:lang] = params[:lang] || "en"
  	redirect_to :action=> "index", :lang=>session[:lang]
  end
  	
end

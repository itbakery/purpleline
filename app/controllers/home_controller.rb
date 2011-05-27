class HomeController < ApplicationController
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  
  def index
  	session[:lang] = params[:lang] || "th"
  	#@newevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(7) if session[:lang]=="th"
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(7) if session[:lang]=="en"  	
  	
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(7) if session[:lang]=="th"
  	@events =  EventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(7) if session[:lang]=="en"  

  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(7) if session[:lang]=="th"
  	@news =  NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(7) if session[:lang]=="en"   	
  	@imageshash = PurpleAsset.where("type=?","Report::Image").group('assetable_id')
    @stations = StationsTranslation.all
    @userip = request.env['REMOTE_ADDR']
    #@member = Member.new
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
 
  def category  	
    @announces = []
  	if params[:id]
  		@category = Category.find(params[:id])	
  		@category.announces.each do |a|
  			@announces <<  AnnouncesTranslation.where(:announce_id=>a.id).where("language_id=?",1)  if session[:lang]=="th"
  			@announces <<  AnnouncesTranslation.where(:announce_id=>a.id).where("language_id=?",2)  if session[:lang]=="en"
  		end		
   end  
  render :layout=>"announce"
  end
  
    def eventstype  	
    @events = []
  	if params[:id]
  		@eventstype = EventsType.find(params[:id])	
  		@eventstype.events.each do |a|
  			@events <<  EventsTranslation.where(:event_id=>a.id).where("language_id=?",1)  if session[:lang]=="th"
  			@events <<  EventsTranslation.where(:event_id=>a.id).where("language_id=?",2)  if session[:lang]=="en"
  		end		
   end  
  render :layout=>"event"
  end
  
    def reportstype  	
    @reports = []
  	if params[:id]
  		@reportstype = ReportsType.find(params[:id])	
  		@reportstype.reports.each do |a|
  			@reports <<  ReportsTranslation.where(:reports_type_id=>a.id).where("language_id=?",1)  if session[:lang]=="th"
  			@reports <<  ReportsTranslation.where(:reports_type_id=>a.id).where("language_id=?",2)  if session[:lang]=="en"
  		end		
   end  
  render :layout=>"report"
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
				
					unless @announces[0].blank?
						s = @announces[0].polypoint.split("\r\n") unless @announces[0].polypoint.blank?
						@p = s.collect {|item| GLatLng.new(item.split(" ")[2..3])}  unless s.nil?
						@polyline =  GPolygon.new(@p,"#ff0000",3,1.0,"#00ff00",1.0)  unless p.nil?
						@map.add_overlay(@polyline) unless p.nil?
				  end				
				
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
  
  def showreport 	
  	if params[:id]
  		@reports = ReportsTranslation.where("id=?",params[:id]).where("publish =?",1)
  	coordinates = ["#{@reports.first.latitude rescue nil}","#{@reports.first.longtitude rescue nil}"]
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,15)	
    @gmarker = GMarker.new(coordinates,:title => "#{@reports.first.title rescue nil}")
    @map.overlay_global_init(@gmarker, "gmarker")
    @map.overlay_init(@gmarker)
  	else
  		@reports = ReportsTranslation.order("start_on desc")
  	end
  	
  	  	@images = PurpleAsset.where("type=?","Report::Image").limit(16)
  	@allreports = ReportsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allreports = ReportsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allreports_month = @allreports.group_by { |t| t.start_on.beginning_of_month}
  	@lasttenreports = ReportsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttenreports = ReportsTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
 	  render :layout=>"report"
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
    if params[:search] 
      @allannounces = AnnouncesTranslation.search params[:search]
    else
  	  @allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	  @allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	end
  	respond_to do |format|
  		format.html  {render :layout=>"announce"}		
  		format.js   {render :layout=>"announce"}
  	end
  end
  
  def lasttenannounce
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttenannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
  end
  
  def monthlyannounce
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allannounces = AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allannounces_month = @allannounces.group_by { |t| t.start_on.beginning_of_month}
  	respond_to do |format|
  		format.html  {render :layout=>'newsletters'}		
  		format.js   {render :layout=>'newsletters'}
  	end
  end
  
  
  def allreport
    if params[:search] 
      @reports = ReportsTranslation.search params[:search]
    else
  	  @reports = ReportsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc") if session[:lang]=="th"
  	  @reports = ReportsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc") if session[:lang]=="en"
  	end
  	respond_to do |format|
  		format.html  {render :layout=>"report"}		
  		format.js   {render :layout=>"report"}
  	end
  end
  
  def latestreport
  	@latestreports = ReportsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc").limit(10) if session[:lang]=="th"
  	@latestreports = ReportsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc").limit(10) if session[:lang]=="en" 
  	respond_to do |format|
  		format.html  {render :layout=>"report"}		
  		format.js   {render :layout=>"report"}
  	end
  end
  
  def monthlyreport
  	@reports = ReportsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc") if session[:lang]=="th"
  	@reports = ReportsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc") if session[:lang]=="en"
  	
  	@reports_month = @reports.group_by { |t| t.created_at.beginning_of_month}
  	respond_to do |format|
  		format.html  {render :layout=>'report'}		
  		format.js    {render :layout=>'report'}
  	end
  end

  def allevent
    if params[:search] 
      @events = EventsTranslation.search params[:search]
    else
  	  @events = EventsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc") if session[:lang]=="th"
  	  @events = EventsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc") if session[:lang]=="en"
  	end
  	respond_to do |format|
  		format.html  {render :layout=>"event"}		
  		format.js   {render :layout=>"event"}
  	end
  end
  
  def latestevent
  	@latestevents = EventsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc").limit(10) if session[:lang]=="th"
  	@latestevents = EventsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc").limit(10) if session[:lang]=="en"  	
  	respond_to do |format|
  		format.html  {render :layout=>"report"}		
  		format.js   {render :layout=>"report"}
  	end
  end
  
  def monthlyevent
  	@events = EventsTranslation.where("publish =?",1).where("language_id=?",1).order("created_at desc") if session[:lang]=="th"
  	@events = EventsTranslation.where("publish =?",1).where("language_id=?",2).order("created_at desc") if session[:lang]=="en"
  	
  	@events_month = @events.group_by { |t| t.start_on.beginning_of_month}
  	respond_to do |format|
  		format.html  {render :layout=>'event'}		
  		format.js   {render :layout=>'event'}
  	end
  end
  
  
  def  allnews
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	respond_to do |format|
  		format.html  {render :layout=>'newsletters'}		
  		format.js   {render :layout=>'newsletters'}
  	end
  end
  
  def lasttennews
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc").limit(10) if session[:lang]=="th"
  	@lasttennewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc").limit(10) if session[:lang]=="en"  	
	  	respond_to do |format|
  		format.html  {render :layout=>'newsletters'}		
  		format.js   {render :layout=>'newsletters'}
  	end
  end
  
  def monthlynews
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",1).order("start_on desc") if session[:lang]=="th"
  	@allnewletters = NewslettersTranslation.where("start_on <=?", Time.now).where("publish =?",1).where("language_id=?",2).order("start_on desc") if session[:lang]=="en"
  	
  	@allnewletters_month = @allnewletters.group_by { |t| t.start_on.beginning_of_month}
  	respond_to do |format|
  		format.html  {render :layout=>'newsletters'}		
  		format.js   {render :layout=>'newsletters'}
  	end
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
      f.title({ :text=>"Overall Progress of Civil Works (C1/C2/C3)  "})
      f.subtitle({:text => "MRT Purple Line Project : Bang Yai – Bang Sue Section -- Source from: PCPL "})
      f.legend({:layout=>"vertical",:align=>"right",:verticalAlign=> "top",:borderWidth =>'top',:style=>{:position=>'absolute', :bottom=>'auto', :left=>'0px', :top=>'20px'}})
      f.options[:x_axis][:categories] = @progresses.map(&:month)
      f.options[:x_axis][:labels] = {:rotation=>-90 , :align => 'right'}
      f.options[:y_axis]={:startOnTick => false,:min=>0,:max=>120}
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

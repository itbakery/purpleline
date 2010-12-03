class HomeController < ApplicationController
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::TagHelper
  def index
  	#@newevents = NewEventsTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)
  	@announces =  AnnouncesTranslation.where("start_on <=?", Time.now).where("publish =?",1).order("start_on desc").limit(5)

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
  	
    @h = HighChart.new('graph') do |f|
      f.title({ :text=>"Combination chart"})
      f.options[:x_axis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
      f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
      f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
      f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
      f.series(:type=> 'pie',:name=> 'Total consumption', 
        :data=> [
          {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
          {:name=> 'John', :y=> 23,:color=> 'green'},
          {:name=> 'Joe', :y=> 19,:color=> 'blue'}
        ],
        :center=> [100, 80], :size=> 100, :showInLegend=> false)
    end

  	render :layout=>"blank"
  end
end

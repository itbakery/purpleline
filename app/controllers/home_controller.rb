class HomeController < ApplicationController

  def index
  	render :layout=>"home"
  end

  def present
       render  :layout => "preset"
  end

  def mrta
  	@mrta = PagesTranslation.find(1)  rescue nil
  	@mrtatrack = PagesTranslation.find(2)  rescue nil
  	render :layout=>"mrta"
  end
  
  def pcpl
  end
end

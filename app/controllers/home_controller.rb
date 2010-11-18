class HomeController < ApplicationController

  def index
  	render :layout=>"home"
  end

  def present
  end

  def mrta
  	render :layout=>"mrta"
  end
  
  def pcpl
  end
end

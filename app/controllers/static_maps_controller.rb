class StaticMapsController < ApplicationController
  def map
    send_file  "#{Rails.root.to_s}/public/map/#{params[:mapname]}/#{params[:filename]}.#{params[:format]}",:disposition =>'inline',:type => StaticMap::Formats[params[:format]]
  end

  def maptile
    send_file  "#{Rails.root.to_s}/public/map/#{params[:mapname]}/#{params[:z]}/#{params[:x]}/#{params[:y]}.#{params[:format]}",:disposition =>'inline',:type => StaticMap::Formats[params[:format]]
  	
  end
end

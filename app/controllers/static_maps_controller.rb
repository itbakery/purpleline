class StaticMapsController < ApplicationController
  def map
    send_file  "#{Rails.root.to_s}/public/maps/#{params[:mapname]}/#{params[:filename]}.#{params[:format]}",:disposition =>'inline',:type => StaticMap::Formats[params[:format]]
  end

end

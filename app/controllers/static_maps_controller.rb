class StaticMapsController < ApplicationController
  def map
    send_file  "#{Rails.root.to_s}/app/views/static_maps/#{params[:mapname]}/#{params[:filename]}.#{params[:format]}",:disposition =>'inline',:type => StaticMap::Formats[params[:format]]
  end

end

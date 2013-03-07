class StaticPagesController < ApplicationController
  def page
  	send_file  "#{Rails.root.to_s}/app/views/static_pages/#{params[:filename]}.#{params[:format]}",:disposition =>'inline',:type => StaticPage::Formats[params[:format]]
  end
end

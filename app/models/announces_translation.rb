class AnnouncesTranslation < ActiveRecord::Base
	belongs_to   :announce
	cattr_reader :per_page
  @@per_page = 20
  scope :date_current, :conditions => ["Date(start_on) <= Date(NOW()) AND Date(stop_on) >=  Date(NOW())"]
  #define_index do
  # 	indexes :title
  #	indexes :content
  # end
end

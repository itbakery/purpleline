class AnnouncesTranslation < ActiveRecord::Base
	belongs_to   :announce
	cattr_reader :per_page
  @@per_page = 20
  define_index do
  	indexes :title
  	indexes :content
  end
end

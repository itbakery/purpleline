class AnnouncesTranslation < ActiveRecord::Base
	cattr_reader :per_page
  @@per_page = 20
  
  define_index do 
  	indexes :title
  	indexes :content
  end
end

class NewslettersTranslation < ActiveRecord::Base
	cattr_reader :per_page
  @@per_page = 10	
  define_index do 
  	indexes :title
  	indexes :content
  end
end

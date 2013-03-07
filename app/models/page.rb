class Page < ActiveRecord::Base
	cattr_reader :per_page
  @@per_page = 10	
	has_friendly_id :name, :use_slug => true
end

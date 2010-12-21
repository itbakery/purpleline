class Station < ActiveRecord::Base
	cattr_reader :per_page
  @@per_page = 10	
  has_many  :purple_assets, :as => :attachable
end

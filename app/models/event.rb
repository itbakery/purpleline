class Event < ActiveRecord::Base
  cattr_reader :per_page
  has_many  :events_translations
  @@per_page = 10	
  has_many  :purple_assets, :as => :attachable
  has_and_belongs_to_many :events_types
end

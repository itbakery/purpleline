class EventsTranslation < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  has_many :images, :class_name=>'EventsTranslation::Image', :as=>:assetable,:dependent => :destroy
  accepts_nested_attributes_for :images
end


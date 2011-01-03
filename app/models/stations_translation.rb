class StationsTranslation < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  has_many :images, :class_name=>'StationsTranslation::Image', :dependent => :destroy, :as=>:assetable
  accepts_nested_attributes_for :images
end

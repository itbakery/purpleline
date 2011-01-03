class StationsTranslation < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  has_many :images, :as=>:assetable, :class_name=>"StationsTranslation::Image", :dependent => :destroy
  accepts_nested_attributes_for :images
end

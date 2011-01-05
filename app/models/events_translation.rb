
class EventsTranslation < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  has_many :images, :as=>:assetable, :class_name=>"EventsTranslation::Image",:dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda {|a| a[:attachment].blank?},:allow_destroy => true
end



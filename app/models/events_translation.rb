
class EventsTranslation < ActiveRecord::Base
  belongs_to  :user	
  cattr_reader :per_page
  @@per_page = 20
  has_many :images, :as=>:assetable, :class_name=>'Event::Image',:dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda {|a| a[:attachment].blank?},:allow_destroy => true

  define_index do 
  	indexes :title
  	indexes :content
  end
end



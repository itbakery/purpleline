class PurpleAsset < ActiveRecord::Base
  has_many  :images
  accepts_nested_attributes_for  :images, :reject_if => lambda {|t| t['image'].nil?}
end

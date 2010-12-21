class PurpleAsset < ActiveRecord::Base
	belongs_to   :attachable, :polymorphic=> true
	cattr_reader :per_page
  @@per_page = 10
  has_many  :images
  accepts_nested_attributes_for  :images, :reject_if => lambda {|t| t['image'].nil?}
end

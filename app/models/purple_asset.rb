class PurpleAsset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic=> true
  delegate :url, :to=> :attachment
end

class Event::Image < PurpleAsset
  has_attached_file :attachment, :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

class Station::Image < PurpleAsset
  has_attached_file :attachment, :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end


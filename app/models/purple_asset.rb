class PurpleAsset < ActiveRecord::Base
 attr_accessible :nil	
  belongs_to :assetable, :polymorphic=> true
  delegate :url, :to=> :attachment
end

class EventsTranslation::Image < PurpleAsset
  attr_accessible :attachment
  has_attached_file :attachment, :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

class StationsTranslation::Image < PurpleAsset
  attr_accessible :attachment
  has_attached_file :attachment, :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

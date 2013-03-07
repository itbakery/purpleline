class Station::Image < PurpleAsset
  has_attached_file :attachment, :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

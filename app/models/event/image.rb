class Event::Image < PurpleAsset
  has_attached_file :attachment,  :url => "/:class/:attachment/:id/:style_:basename.:extension",
         :styles => { :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

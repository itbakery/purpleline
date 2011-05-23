class Report::Image < PurpleAsset
  has_attached_file :attachment, :url => "/:class/:attachment/:id/:style_:basename.:extension",
                    :styles => {:thumb => "130x70#", :small => "200x150>", :middle => "400x300>" ,:large => "800x600>" }	
end

class Avatar::Image < PurpleAsset
  has_attached_file :attachment, :styles => { :small => "80x80>", :small => "120x120>", :middle => "400x300>" ,:large => "800x600>" }	
end

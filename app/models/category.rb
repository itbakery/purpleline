class Category < ActiveRecord::Base
	has_and_belongs_to_many :announces
  has_attached_file  :icon, :styles => {:iconsmall=>"32x32>"}
end

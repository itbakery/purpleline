class EventsType < ActiveRecord::Base
  has_and_belongs_to_many :events
   has_attached_file  :icon, :styles => {:iconsmall=>"32x32>"},
  :url  => "/icons/:id/:style/:basename.:extension",
  :path => ":rails_root/public/icons/:id/:style/:basename.:extension", :dependent => :destroy
  validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png']
end

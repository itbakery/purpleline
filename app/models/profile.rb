class Profile < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	has_attached_file  :icon, :styles => {:iconsmall=>"32x32#",:small=>"48x48>",:normal=>"85x85>"},
  :url  => "/avatars/:id/:style/:basename.:extension",
  :path => ":rails_root/public/avatars/:id/:style/:basename.:extension"
  validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png']
  cattr_reader :per_page
  @@per_page = 10	
end

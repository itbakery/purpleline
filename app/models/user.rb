class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,:token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :profile
  has_and_belongs_to_many  :roles
  has_one :avatar, :as=>:assetable, :class_name=>'Avatar::Image',:dependent => :destroy
  accepts_nested_attributes_for :avatar, :reject_if => lambda {|a| a[:attachment].blank?},:allow_destroy => true
  def role?(role)
    return !!self.roles.include?(role.to_s.camelize)
  end
  cattr_reader :per_page
  @@per_page = 10
  has_many :reports_translations
  has_many :events_translations
end

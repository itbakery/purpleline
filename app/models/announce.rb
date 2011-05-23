class Announce < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  has_many   :announces_translations;
  has_and_belongs_to_many  :categories
  has_many  :purple_assets, :as => :attachable
end

class AnnouncesCategories < ActiveRecord::Base
    belongs_to :announce
    belongs_to :category
end

class Report < ActiveRecord::Base
    has_many :reports_translations
	has_and_belongs_to_many :reports_types
end

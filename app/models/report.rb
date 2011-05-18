class Report < ActiveRecord::Base
	has_and_belongs_to_many :reports_types
end

class ReportsType < ActiveRecord::Base
	has_and_belongs_to_many :reports
end

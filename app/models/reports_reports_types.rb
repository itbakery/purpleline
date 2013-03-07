class ReportsReportsTypes < ActiveRecord::Base
  belongs_to :report
  belongs_to :reports_type
end

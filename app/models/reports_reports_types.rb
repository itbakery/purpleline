class ReportsReportsTypes < ActiveRecord::Base
  belongs_to :report
  belongs_to :reports_type
  named_scope :date_current, :conditions => ["Date(start_on) <= Date(NOW()) AND Date(stop_on) >=  Date(NOW())"]
end

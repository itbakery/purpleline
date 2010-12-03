class AddIssuedateToProgresses < ActiveRecord::Migration
  def self.up
    add_column :progresses, :issuedate, :date
  end

  def self.down
    remove_column :progresses, :issuedate
  end
end

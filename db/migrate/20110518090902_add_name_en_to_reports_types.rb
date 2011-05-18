class AddNameEnToReportsTypes < ActiveRecord::Migration
  def self.up
    add_column :reports_types, :name_en, :string
  end

  def self.down
    remove_column :reports_types, :name_en
  end
end

class RenameNameToReportsTypes < ActiveRecord::Migration
  def self.up
       rename_column  :reports_types,  :name, :name_th
  end

  def self.down
  end
end

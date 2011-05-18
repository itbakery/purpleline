class RenameNameToEventsTypes < ActiveRecord::Migration
  def self.up
      rename_column   :events_types, :name, :name_th
  end

  def self.down
  end
end

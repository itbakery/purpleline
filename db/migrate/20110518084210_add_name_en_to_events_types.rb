class AddNameEnToEventsTypes < ActiveRecord::Migration
  def self.up
    add_column :events_types, :name_en, :string
  end

  def self.down
    remove_column :events_types, :name_en
  end
end

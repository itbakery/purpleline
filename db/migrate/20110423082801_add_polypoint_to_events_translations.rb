class AddPolypointToEventsTranslations < ActiveRecord::Migration
  def self.up
    add_column :events_translations, :polypoint, :text
  end

  def self.down
    remove_column :events_translations, :polypoint
  end
end

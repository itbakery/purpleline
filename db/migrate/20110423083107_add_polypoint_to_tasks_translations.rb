class AddPolypointToTasksTranslations < ActiveRecord::Migration
  def self.up
    add_column :tasks_translations, :polypoint, :text
  end

  def self.down
    remove_column :tasks_translations, :polypoint
  end
end

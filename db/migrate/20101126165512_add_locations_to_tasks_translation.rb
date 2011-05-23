class AddLocationsToTasksTranslation < ActiveRecord::Migration
  def self.up
    add_column :tasks_translations, :latitude, :float
    add_column :tasks_translations, :longtitude, :float
  end

  def self.down
    remove_column :tasks_translations, :longtitude
    remove_column :tasks_translations, :latitude
  end
end

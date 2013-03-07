class AddTaskToAnnouncesTranslations < ActiveRecord::Migration
  def self.up
    add_column :announces_translations, :task_id, :integer
  end

  def self.down
    remove_column :announces_translations, :task_id
  end
end

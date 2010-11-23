class CreateTasksTranslations < ActiveRecord::Migration
  def self.up
    create_table :tasks_translations do |t|
      t.integer :task_id
      t.integer :language_id
      t.integer :station_id
      t.string :title
      t.text :content
      t.boolean :publish
      t.date :start_on
      t.date :stop_on
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks_translations
  end
end

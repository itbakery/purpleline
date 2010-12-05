class CreateEventsTranslations < ActiveRecord::Migration
  def self.up
    create_table :events_translations do |t|
      t.integer :event_id
      t.integer :events_type_id
      t.integer :language_id
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longtitude
      t.date :start_on
      t.date :stop_on
      t.integer :user_id
      t.boolean :publish

      t.timestamps
    end
  end

  def self.down
    drop_table :events_translations
  end
end

class CreateAnnouncesTranslations < ActiveRecord::Migration
  def self.up
    create_table :announces_translations do |t|
      t.integer :announce_id
      t.integer :announces_type_id
      t.integer :language_id
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longtitude
      t.date :start_on
      t.date :stop_on
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :announces_translations
  end
end

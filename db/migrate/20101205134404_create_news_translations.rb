class CreateNewsTranslations < ActiveRecord::Migration
  def self.up
    create_table :news_translations do |t|
      t.integer :new_id
      t.integer :news_type_id
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
    drop_table :news_translations
  end
end

class CreateNewslettersTranslations < ActiveRecord::Migration
  def self.up
    create_table :newsletters_translations do |t|
      t.integer :newsletter_id
      t.integer :newsletters_type_id
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
    drop_table :newsletters_translations
  end
end

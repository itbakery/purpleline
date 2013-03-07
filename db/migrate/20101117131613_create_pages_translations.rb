class CreatePagesTranslations < ActiveRecord::Migration
  def self.up
    create_table :pages_translations do |t|
      t.integer :page_id
      t.integer :language_id
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
    drop_table :pages_translations
  end
end

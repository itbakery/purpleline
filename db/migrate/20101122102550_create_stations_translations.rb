class CreateStationsTranslations < ActiveRecord::Migration
  def self.up
    create_table :stations_translations do |t|
      t.integer :station_id
      t.integer :language_id
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end

  def self.down
    drop_table :stations_translations
  end
end

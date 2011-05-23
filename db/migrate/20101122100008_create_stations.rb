class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string :name
      t.string :cached_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :stations
  end
end

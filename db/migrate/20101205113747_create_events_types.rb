class CreateEventsTypes < ActiveRecord::Migration
  def self.up
    create_table :events_types do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :events_types
  end
end

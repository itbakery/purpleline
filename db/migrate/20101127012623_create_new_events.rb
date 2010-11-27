class CreateNewEvents < ActiveRecord::Migration
  def self.up
    create_table :new_events do |t|
      t.string :name
      t.string :cached_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :new_events
  end
end

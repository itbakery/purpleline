class CreateEventsEventsTypes < ActiveRecord::Migration
  def self.up
    create_table :events_events_types, :id=> false , :force => true do |t|
      t.integer :event_id
      t.integer :events_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events_events_types
  end
end

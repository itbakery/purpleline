class CreateAnnounces < ActiveRecord::Migration
  def self.up
    create_table :announces do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :announces
  end
end
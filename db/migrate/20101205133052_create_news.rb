class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end

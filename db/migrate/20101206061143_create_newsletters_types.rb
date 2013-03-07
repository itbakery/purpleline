class CreateNewslettersTypes < ActiveRecord::Migration
  def self.up
    create_table :newsletters_types do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters_types
  end
end

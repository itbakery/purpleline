class CreateAnnouncesTypes < ActiveRecord::Migration
  def self.up
    create_table :announces_types do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :announces_types
  end
end

class CreateReportsTypes < ActiveRecord::Migration
  def self.up
    create_table :reports_types do |t|
      t.string :name
      t.string :cache_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :reports_types
  end
end

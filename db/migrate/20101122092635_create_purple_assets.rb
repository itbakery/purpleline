class CreatePurpleAssets < ActiveRecord::Migration
  def self.up
    create_table :purple_assets do |t|
      t.string :title
      t.string :type
      t.integer :attachable_id
      t.string :attachable_type
      t.boolean :publish
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end

  def self.down
    drop_table :purple_assets
  end
end

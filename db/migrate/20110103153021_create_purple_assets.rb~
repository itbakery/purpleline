class CreatePurpleAssets < ActiveRecord::Migration
  def self.up
    create_table :purple_assets do |t|
      t.string :type
      t.references :assetable
      t.float :latitude
      t.float :longtitude
      t.boolean :publish
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purple_assets
  end
end

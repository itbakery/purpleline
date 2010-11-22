class CreatePurpleAssetResources < ActiveRecord::Migration
  def self.up
    create_table :purple_asset_resources do |t|
      t.string :caption
      t.integer :purple_asset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purple_asset_resources
  end
end

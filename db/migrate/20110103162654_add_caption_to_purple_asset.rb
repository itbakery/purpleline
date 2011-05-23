class AddCaptionToPurpleAsset < ActiveRecord::Migration
  def self.up
    add_column :purple_assets, :caption, :string
  end

  def self.down
    remove_column :purple_assets, :caption
  end
end

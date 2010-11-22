class AddAttachmentResourceToPurpleAssetResource < ActiveRecord::Migration
  def self.up
    add_column :purple_asset_resources, :resource_file_name, :string
    add_column :purple_asset_resources, :resource_content_type, :string
    add_column :purple_asset_resources, :resource_file_size, :integer
    add_column :purple_asset_resources, :resource_updated_at, :datetime
  end

  def self.down
    remove_column :purple_asset_resources, :resource_file_name
    remove_column :purple_asset_resources, :resource_content_type
    remove_column :purple_asset_resources, :resource_file_size
    remove_column :purple_asset_resources, :resource_updated_at
  end
end

class AddAttachmentAttachmentToPurpleAssets < ActiveRecord::Migration
  def self.up
    add_column :purple_assets, :attachment_file_name, :string
    add_column :purple_assets, :attachment_content_type, :string
    add_column :purple_assets, :attachment_file_size, :integer
    add_column :purple_assets, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :purple_assets, :attachment_file_name
    remove_column :purple_assets, :attachment_content_type
    remove_column :purple_assets, :attachment_file_size
    remove_column :purple_assets, :attachment_updated_at
  end
end

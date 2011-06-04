class AddCaptionEnToPurpleAssets < ActiveRecord::Migration
  def self.up
    add_column :purple_assets, :caption_en, :string
  end

  def self.down
    remove_column :purple_assets, :caption_en
  end
end

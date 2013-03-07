class AddPublishToAnnouncesTranslation < ActiveRecord::Migration
  def self.up
    add_column :announces_translations, :publish, :boolean
  end

  def self.down
    remove_column :announces_translations, :publish
  end
end

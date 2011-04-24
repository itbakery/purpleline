class AddPolypointToAnnouncesTranslations < ActiveRecord::Migration
  def self.up
    add_column :announces_translations, :polypoint, :text
  end

  def self.down
    remove_column :announces_translations, :polypoint
  end
end

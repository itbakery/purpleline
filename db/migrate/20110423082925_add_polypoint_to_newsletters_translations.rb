class AddPolypointToNewslettersTranslations < ActiveRecord::Migration
  def self.up
    add_column :newsletters_translations, :polypoint, :text
  end

  def self.down
    remove_column :newsletters_translations, :polypoint
  end
end

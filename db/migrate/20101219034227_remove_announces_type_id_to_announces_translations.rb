class RemoveAnnouncesTypeIdToAnnouncesTranslations < ActiveRecord::Migration
  def self.up
  end

  def self.down
    remove_column :announces_translations, :announces_type_id
  end
end

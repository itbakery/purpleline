class AddCodeToStationsTranslations < ActiveRecord::Migration
  def self.up
    add_column :stations_translations, :code, :string
  end

  def self.down
    remove_column :stations_translations, :code
  end
end

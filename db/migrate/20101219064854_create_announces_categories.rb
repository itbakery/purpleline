class CreateAnnouncesCategories < ActiveRecord::Migration
  def self.up
    create_table :announces_categories ,:id => false do |t|
      t.integer :announce_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :announces_categories
  end
end

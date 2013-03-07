class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name_th
      t.string :name_en

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end

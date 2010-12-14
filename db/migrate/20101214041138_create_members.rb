class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :username
      t.string :email
      t.string :registerip
      t.float :latitude
      t.float :longtitude
      t.text :comment
      t.boolean :getnews

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end

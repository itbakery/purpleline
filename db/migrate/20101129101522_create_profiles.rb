class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :name
      t.string :surname
      t.string :position
      t.string :telephone
      t.string :mobile
      t.integer :email

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end

class CreateProgresses < ActiveRecord::Migration
  def self.up
    create_table :progresses do |t|
      t.string :month
      t.float :schedule
      t.float :actual
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :progresses
  end
end

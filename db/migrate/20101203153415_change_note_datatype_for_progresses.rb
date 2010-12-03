class ChangeNoteDatatypeForProgresses < ActiveRecord::Migration
  def self.up
    change_table :progresses do |t|
       t.change :note, :text
    end
  end

  def self.down
  end
end

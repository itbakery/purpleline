class CreateReportsReportsTypes < ActiveRecord::Migration
  def self.up
    create_table :reports_reports_types , :id => false ,:force => true do |t|
      t.integer :report_id
      t.integer :reports_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :reports_reports_types
  end
end

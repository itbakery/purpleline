class CreateReportsTranslations < ActiveRecord::Migration
  def self.up
    create_table :reports_translations do |t|
      t.integer :report_id
      t.integer :reports_type_id
      t.integer :language_id
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longtitude
      t.date :start_on
      t.date :stop_on
      t.integer :user_id
      t.integer :task_id
      t.boolean :publish
      t.text :polypoint

      t.timestamps
    end
  end

  def self.down
    drop_table :reports_translations
  end
end

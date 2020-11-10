class AddForeignKeyLm < ActiveRecord::Migration[6.0]
  def change
    add_column :marks, :created_at, :datetime, precision: 6, null: false
    add_column :marks, :updated_at, :datetime, precision: 6, null: false
    add_column :marks, :lab_report_id, :bigint
    add_foreign_key :marks, :lab_reports
  end
end

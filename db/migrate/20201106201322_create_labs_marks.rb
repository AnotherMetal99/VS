class CreateLabsMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_reports do |t|
      t.string :title, validates: { uniqueness: :true }, limit: 250, null: false
      t.string :description, validates: { uniqueness: :true }, limit: 500, null: false

      t.timestamps
    end

    create_table :marks do |t|
      t.integer :points, validates: { in: 0..100 }
      t.string :letter, null: false
    end
  end
end

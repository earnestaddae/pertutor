class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :lecture, null: false, foreign_key: true
      t.integer :tutor_id
      t.integer :student_id
      t.integer :pay_type
      t.integer :pay_provider

      t.timestamps
    end
  end
end

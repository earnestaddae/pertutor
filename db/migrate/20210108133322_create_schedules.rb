class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :available_date
      t.integer :students_allowed
      t.decimal :price, precision: 8, scale: 2
      t.integer :medium, default: 0

      t.timestamps
    end
  end
end

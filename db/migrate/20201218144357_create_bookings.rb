class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.datetime :tuition_date
      t.decimal :budget, precision: 8, scale: 2

      t.timestamps
    end
  end
end

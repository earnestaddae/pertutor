class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price, precision: 8, scale: 2
      t.integer :student_limit
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

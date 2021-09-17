class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :body
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

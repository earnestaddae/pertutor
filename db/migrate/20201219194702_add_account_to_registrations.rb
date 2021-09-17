class AddAccountToRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_reference :registrations, :account, null: false, foreign_key: true
  end
end

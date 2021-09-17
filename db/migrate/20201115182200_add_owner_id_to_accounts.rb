class AddOwnerIdToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :owner_id, :integer
  end
end

class AddTokenToInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :token, :string
    add_index :invitations, :token
  end
end

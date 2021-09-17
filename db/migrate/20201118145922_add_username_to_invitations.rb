class AddUsernameToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :username, :string
  end
end

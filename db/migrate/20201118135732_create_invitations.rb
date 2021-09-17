class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

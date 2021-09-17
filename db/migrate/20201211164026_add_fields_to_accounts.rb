class AddFieldsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :bio, :text
    add_column :accounts, :tagline, :string
    add_column :accounts, :home_color, :string
    add_column :accounts, :footer_color, :string
    add_column :accounts, :address, :text
    add_column :accounts, :phone_number, :string
    add_column :accounts, :city, :string
    add_column :accounts, :country, :string
  end
end

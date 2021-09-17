class AddSidebarColorsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :sidebar_header_color, :string
    add_column :accounts, :sidebar_body_color, :string
  end
end

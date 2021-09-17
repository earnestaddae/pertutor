class AddTitleToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :title, :string
  end
end

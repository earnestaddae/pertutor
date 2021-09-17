class AddPaymentsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :pay_type, :integer
    add_column :bookings, :pay_provider, :integer
  end
end

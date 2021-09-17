class AddSlugToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :slug, :string
    add_index :bookings, :slug, unique: true
  end
end

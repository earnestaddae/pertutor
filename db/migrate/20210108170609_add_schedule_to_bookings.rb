class AddScheduleToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :schedule, foreign_key: true
  end
end

class Booking < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_tenant :account
  belongs_to :user
  belongs_to :schedule

  has_rich_text :content

  # monetize :budget, as: "amount"
  validates_presence_of :content, :title, :pay_type
  # validates_presence_of :content, :budget, :tuition_date, :title
  # validates_numericality_of :budget,
  #                           greater_than_or_equal_to: 0,
  #                           format: { with: /^\d{1,4}(\.\d{0,2})?$/ }
  # hint: https://thoughtbot.com/upcase/videos/advanced-querying-belongs-to
  # ensures that at least there is a booking and the schedule date is not passed
  scope :upcoming_bookings, lambda { where.not(id: nil ).joins(:schedule).where("available_date > ?", Date.today) }

  # ensures that at least there is a booking and the schedule date has passed
  scope :past_bookings, lambda { where.not(id: nil ).joins(:schedule).where("available_date < ?", Date.today) }

  enum pay_type: {
    "Mobile money" => 0,
    "Credit / Debit card" => 1
    # "Cash" => 2,
  }

  enum pay_provider: {
    "MTN" => 0,
    "Vodafone" => 1,
    "Airtel/Tigo" => 2
  }
end

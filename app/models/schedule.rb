class Schedule < ApplicationRecord
  acts_as_tenant :account
  belongs_to :user
  has_many :bookings, dependent: :destroy

  enum medium: {
    online: 0,
    in_person: 1
    # "Online" => 0,
    # "In-Person" => 1
  }

  monetize :price, as: "lesson_fee"
  validates_presence_of :available_date, :price, :medium
  # validates_presence_of :available_date, :price, :students_allowed, :medium
  # validates :students_allowed, length: { maximum: 2 }
  # validates :students_allowed, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates_numericality_of :price,
                            greater_than_or_equal_to: 0,
                            format: { with: /^\d{1,4}(\.\d{0,2})?$/ }
  # scope :without_bookings, -> { includes(:bookings).where.not(booking: {id: nil}) }
  scope :without_bookings, lambda {includes(:bookings).where("available_date > ?", Date.today) }

  def start_time
    self.available_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

end

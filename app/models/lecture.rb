class Lecture < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_rich_text :description
  belongs_to :user
  has_many :registrations
  has_many :students, through: :registrations
  acts_as_tenant :account


  validates_presence_of :title, :summary, :description, :price, :student_limit,
                        :start_date, :end_date
  validates_length_of :summary, within: 10..100
  validates_length_of :description, minimum: 100

  monetize :price, as: "fee"
  validates_numericality_of :price,
                            greater_than_or_equal_to: 0,
                            format: { with: /^\d{1,4}(\.\d{0,2})?$/ }
  validates :student_limit, length: { maximum: 2 }
  validates :student_limit, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99}
  scope :include_upcoming_lessons, lambda { where("end_date > ?", Date.today) }
  scope :include_past_lessons, lambda { where("end_date < ?", Date.today)}

  # keeps record of the number of seats left
  def seats_left
    student_limit - students.count
  end

  # checks whether class is full
  def seats_left?
    student_limit == students.count
  end
end

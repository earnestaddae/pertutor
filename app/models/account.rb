class Account < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :name, use: :slugged

  # ensures that subdomain is saved in downcase
  def subdomain=(val)
    write_attribute(:subdomain, val.downcase.split(" ").join)
  end

  belongs_to :owner, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :lectures, dependent: :destroy
  has_many :forums, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :schedules, dependent: :destroy

  has_one_attached :background_image
  has_one_attached :account_logo
  has_rich_text :bio

  accepts_nested_attributes_for :owner

  validates_presence_of :name, :subdomain
  validates_uniqueness_of :name, :subdomain

  validates :account_logo, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                                    size: { less_than: 2.megabytes,
                                             message:   "should be less than 5MB" }
  validates :background_image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                                    size: { less_than: 5.megabytes,
                                             message:   "should be less than 5MB" }
end

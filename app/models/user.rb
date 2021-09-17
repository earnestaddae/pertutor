class User < ApplicationRecord
  rolify
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates_presence_of :username
  validates_uniqueness_of :username
  validates :username, length: { maximum: 50 }
  has_many :memberships
  has_many :accounts, through: :memberships
  has_many :lectures, dependent: :destroy
  has_many :forums, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :tutored_lectures, class_name: "Registration", foreign_key: "tutor_id" # as tutor
  has_many :learned_lectures, class_name: "Registration", foreign_key: "student_id" # as student
  has_many :schedules, dependent: :destroy


  # converts user default to username
  def to_s
    username
  end

  # ensures that username is saved in downcase
  def username=(val)
    write_attribute(:username, val.downcase.split(" ").join)
  end

  # accounts owned by user
  def owned_accounts
    Account.where(owner: self)
  end

end

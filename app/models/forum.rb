class Forum < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_tenant :account
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :body

  validates_presence_of :title, :body, :summary
end

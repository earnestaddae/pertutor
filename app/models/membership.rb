class Membership < ApplicationRecord
  acts_as_tenant :account
  belongs_to :user
end

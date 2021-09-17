class Invitation < ApplicationRecord
  before_create :generate_token
  acts_as_tenant :account

  def username=(val)
    write_attribute(:username, val.downcase.split(" ").join)
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :email, :username
  # validates_uniqueness_of :email
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_length_of :email, maximum: 255

  # this uses the token as the params
  def to_param
    token
  end



  private
    # generates token for the invited user
    def generate_token
      self.token = SecureRandom.hex(16)
    end

end

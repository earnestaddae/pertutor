class Registration < ApplicationRecord
  acts_as_tenant :account
  belongs_to :lecture
  belongs_to :tutor, class_name: "User", foreign_key: "tutor_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id"

  validates_presence_of :pay_type, :pay_provider

  validates_uniqueness_of :student_id, scope: :lecture_id,
                          message: "can only register once per lesson"



  enum pay_type: {
    "Mobile money" => 0,
    "Credit card" => 1,
    "Cash" => 2,
  }

  enum pay_provider: {
    "MTN" => 0,
    "Vodafone" => 1,
    "Airtel/Tigo" => 2
  }

end

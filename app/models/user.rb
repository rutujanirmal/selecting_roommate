class User < ApplicationRecord
  belongs_to :room, optional: true

  validates :full_name, presence: true
  validates :emp_id, presence: true, uniqueness: true
  validates :email , presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
  validates :gender ,presence: true,  format: {with: GENDER_REGEX}

  enum role: {
    "employee": "employee",
    "admin": "admin"
  }
  
end

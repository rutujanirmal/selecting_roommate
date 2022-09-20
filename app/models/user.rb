class User < ApplicationRecord
  belongs_to :room

  validates :full_name, presence: true
  validates :emp_id, presence: true, unique: true
  validates :email , presence: true, format: {with: EMAIL_REGEX}
  validates :gender ,presence: true,  format: {with: GENDER_REGEX}

  enum role: {
    "employee": "employee",
    "admin": "admin"
  }
  
end

class Employee < ApplicationRecord
  validates :email , format: {with: EMAIL_REGEX}
  validates :gender , format: {with: GENDER_REGEX}

  enum role: {
    "employee": 0,
    "admin": 0
  }
  
end

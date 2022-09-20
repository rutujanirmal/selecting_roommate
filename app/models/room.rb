class Room < ApplicationRecord
  has_many :users

  validates :booked_by, presence: true
  validates :roommates, presence: true
  
end

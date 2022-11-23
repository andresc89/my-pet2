class Booking < ApplicationRecord
  has_many :pets, through: :user
end

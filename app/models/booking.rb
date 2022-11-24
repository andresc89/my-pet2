class Booking < ApplicationRecord
  has_many :pets, through: :user
  belongs_to :user
  belongs_to :pet
end

class Trail < ApplicationRecord
  has_many :trip_trail
  has_many :trips, through: :trip_trail
end

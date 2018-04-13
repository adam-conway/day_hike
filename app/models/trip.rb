class Trip < ApplicationRecord
  has_many :trip_trail
  has_many :trails, through: :trip_trail
end

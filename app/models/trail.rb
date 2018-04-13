class Trail < ApplicationRecord
  has_many :trip_trail
  has_many :trips, through: :trip_trail

  def self.total_hiking_distance
    sum(:length)
  end

  def self.average_hiking_distance
    average(:length)
  end
end

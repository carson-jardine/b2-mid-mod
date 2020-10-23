class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :park_rides, through: :mechanic_rides
end

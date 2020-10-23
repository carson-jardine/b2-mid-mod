class MechanicRide < ApplicationRecord
  belongs_to :park_ride
  belongs_to :mechanic
end

class ParkRide < ApplicationRecord
  belongs_to :amusement_park

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end

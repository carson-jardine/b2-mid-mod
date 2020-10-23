class ParkRide < ApplicationRecord
  belongs_to :amusement_park

  def self.average_thrill_rating
    average(:thrill_rating).round(1)
  end

  def self.search(search)
    if search
      self.where(["id like ?", "#{search}"])
    end
  end
end

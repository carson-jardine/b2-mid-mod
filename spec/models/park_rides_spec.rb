require 'rails_helper'

describe ParkRide do
  describe "relationship" do
    it {should belong_to :amusement_park}
  end

  describe "class methods" do
    it ".average_thrill_rating" do
      @hershey_park = AmusementPark.create!({name: "Hershey Park", admission: "$50.00"})
      @ride_1 = ParkRide.create!({name: "Lightning Racer", thrill_rating: 5, amusement_park_id: "#{@hershey_park.id}"})
      @ride_2 = ParkRide.create!({name: "Storm Runner", thrill_rating: 8, amusement_park_id: "#{@hershey_park.id}"})

      expect(ParkRide.average_thrill_rating).to eq(6.5)
    end
  end
end

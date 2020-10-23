require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the amusement parks show page' do
    before :each do
      @hershey_park = AmusementPark.create!({name: "Hershey Park", admission: "$50.00"})
      @ride_1 = ParkRide.create!({name: "Lightning Racer", thrill_rating: 5, amusement_park_id: "#{@hershey_park.id}"})
      @ride_2 = ParkRide.create!({name: "Storm Runner", thrill_rating: 8, amusement_park_id: "#{@hershey_park.id}"})

    end
    it "I see the name and price of admissions, names of all rides, and avg thrill rating" do
        visit "/amusement_parks/#{@hershey_park.id}"

        expect(page).to have_content("#{@hershey_park.name}")
        expect(page).to have_content("#{@hershey_park.admission}")
        expect(page).to have_content("#{@ride_1.name}")
        expect(page).to have_content("#{@ride_2.name}")
        expect(page).to have_content(ParkRide.average_thrill_rating)


    end

  end
end

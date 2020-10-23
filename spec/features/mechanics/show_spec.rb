require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a mechanics show page' do
    before :each do
      @mechanic_1 = Mechanic.create!({name: "Sam Mills", experience: 10})
      @mechanic_2 = Mechanic.create!({name: "Kara Smith", experience: 11})
      @hershey_park = AmusementPark.create!({name: "Hershey Park", admission: "$50.00"})
      @ride_1 = ParkRide.create!({name: "Lightning Racer", thrill_rating: 5, amusement_park_id: "#{@hershey_park.id}"})
      @ride_2 = ParkRide.create!({name: "Storm Runner", thrill_rating: 8, amusement_park_id: "#{@hershey_park.id}"})
      @ride_3 = ParkRide.create!({name: "The Frog Hopper", thrill_rating: 3, amusement_park_id: "#{@hershey_park.id}"})

      MechanicRide.create!({mechanic_id: @mechanic_1.id, park_ride_id: @ride_1.id})
      MechanicRide.create!({mechanic_id: @mechanic_1.id, park_ride_id: @ride_2.id})
    end
    it "I see their name, details, and rides they are working on" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content("#{@mechanic_1.name}")
      expect(page).to have_content("#{@mechanic_1.experience}")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")

      expect(page).to_not have_content("#{@ride_3.name}")
    end

    it "I see a form to add a ride to their workload and can submit that form" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content("Add a ride to workload:")
      fill_in :search, with: "#{@ride_3.id}"

      click_on "Submit"
      expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")
      expect(page).to have_content("#{@ride_3.name}")
    end
  end
end

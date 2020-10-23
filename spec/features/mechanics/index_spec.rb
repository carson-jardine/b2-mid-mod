require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the mechanics index page' do
    before :each do
      @mechanic_1 = Mechanic.create!({name: "Sam Mills", experience: 10})
    end
    it "I see a header saying 'All Mechanics' as well as their details" do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content("#{@mechanic_1.name}")
      expect(page).to have_content("#{@mechanic_1.experience}")
    end
  end
end

require 'rails_helper'

describe AmusementPark do
  describe 'relationship' do
    it {should have_many :park_rides}
  end
end

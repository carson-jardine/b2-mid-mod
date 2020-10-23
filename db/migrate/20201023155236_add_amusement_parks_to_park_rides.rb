class AddAmusementParksToParkRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :park_rides, :amusement_park, foreign_key: true
  end
end

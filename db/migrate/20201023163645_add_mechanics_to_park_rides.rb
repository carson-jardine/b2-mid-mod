class AddMechanicsToParkRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :park_rides, :mechanic, foreign_key: true
  end
end

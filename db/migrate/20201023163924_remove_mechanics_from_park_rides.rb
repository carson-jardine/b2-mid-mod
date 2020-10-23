class RemoveMechanicsFromParkRides < ActiveRecord::Migration[5.2]
  def change
    remove_reference :park_rides, :mechanic, foreign_key: true
  end
end

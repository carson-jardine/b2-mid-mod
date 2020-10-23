class CreateParkRides < ActiveRecord::Migration[5.2]
  def change
    create_table :park_rides do |t|
      t.string :name
      t.integer :thrill_rating
    end
  end
end

class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    park_ride = ParkRide.find(params[:id])
    mechanic_ride = MechanicRide.new({mechanic_id: params[:mechanic_id], park_ride_id: params[:park_ride_id]})

    mechanic_ride.save
    redirect_to "/mechanics/#{mechanic.id}"
  end
end

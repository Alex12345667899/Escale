class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    redirect_to trip_path(@trip)
  end

  # def destroy
  #     @trip = Trip.find(params[:id])
  #     @trip.destroy
  #     redirect_to trips_path, status: :see_other
  # end

  private

  def trip_params
    params.require(:trip).permit(:title, :description)
  end

end

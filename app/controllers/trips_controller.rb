class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def trains
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.category = params[:trip][:category].join(" ").strip
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
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

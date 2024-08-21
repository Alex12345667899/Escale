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
    if @trip.save
      respond_to do |format|
        format.html { redirect_to trips_path(@trip) }
        format.turbo_stream
      end
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

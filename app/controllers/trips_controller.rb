class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def trains
  end
end

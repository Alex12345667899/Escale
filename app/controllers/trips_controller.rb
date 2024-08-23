class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @trips = Trip.all
    # PG search
    if params[:search] && params[:search][:query].present?
      @trips = Trip.search_by_title_and_description(params[:search][:query])
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @user_trip_bookmark = Bookmark.find_by(user: current_user, trip: @trip)
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
    params.require(:trip).permit(:title, :description, steps_attributes: [:id,
                                                                          :_destroy,
                                                                          :description,
                                                                          :content,
                                                                          :title])
  end
end

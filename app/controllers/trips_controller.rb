class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @trips = Trip.all
    if params[:search] && params[:search][:query].present?
      @trips = Trip.search_by_title_and_description(params[:search][:query])
    elsif params[:category].present?
      @trips = Trip.where('category LIKE ?', "%#{params[:category]}%")
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
      const = 0
      @trip.steps.each do |step|
        step.order = const
        const += 1
        step.save
      end
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :category, :photo, steps_attributes: %i[id destroy content title photo])
  end
end

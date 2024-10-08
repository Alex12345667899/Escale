class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @trips = Trip.all
    if params[:search] && params[:search][:query].present?
      @trips = Trip.search_by_title_and_description(params[:search][:query])
    elsif params[:category].present?
      @trips = Trip.where('category LIKE ?', "%#{params[:category]}%")
    elsif params[:trip] && params[:trip][:total_distance].present?
      @trips = Trip.where('total_distance <= ?', "#{params[:trip][:total_distance]}")
    elsif params[:trip] && params[:trip][:total_duration].present?
      @trips = Trip.where('total_duration <= ?', "#{params[:trip][:total_duration]}")
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @reviews = @trip.reviews
    @user_trip_bookmark = Bookmark.find_by(user: current_user, trip: @trip)
    @markers = @trip.steps.order(:order).map do |step|
      {
        lat: step.latitude,
        lng: step.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def trains
    @trip = Trip.find(params[:id])
    @reviews = @trip.reviews
    @user_trip_bookmark = Bookmark.find_by(user: current_user, trip: @trip)
  end

  def book
    trip = Trip.find(params[:id])
    step_depart = Step.find(params[:step]).title.split[0]
    step_arrivee = trip.steps[params[:index].to_i+1].title.split[0]
    url = "https://www.trainline.fr/search/#{step_depart}/#{step_arrivee}"
    button = ClicTrainsApi.new(url)
    button.call
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
      @trip.set_total_distance_and_duration
      @trip.set_footprint
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :category, :total_distance, :total_duration, :photo, steps_attributes: %i[id destroy duration content title photo])
  end
end

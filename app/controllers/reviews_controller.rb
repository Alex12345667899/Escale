class ReviewsController < ApplicationController
  before_action :set_trip, only: %i[create]

  def new
    @review = Review.new
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def create
    @review = Review.new(review_params)
    @review.trip = @trip
    @review.user = current_user
    if @review.save
      flash[:success] = "Review was successfully created !"
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Bookmark.find(params[:bookmark_id]).trip
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

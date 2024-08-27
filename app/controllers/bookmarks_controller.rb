class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: %i[update]

  def index
    # @bookmarks = Bookmark.all
    @to_do_bookmarks = Bookmark.where(user: current_user).where(status: :to_do)
    @done_bookmarks = Bookmark.where(user: current_user).where(status: :done)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.status = :to_do
    if @bookmark.save
      redirect_to trip_path(@bookmark.trip), success: "Trip bookmarked !"
    else
      redirect_to trip_path(@bookmark.trip), alert: "Unable to bookmark trip"
    end
  end

  def update
    @bookmark.status = params[:status]
    if @bookmark.save
      redirect_to bookmarks_path, notice: 'Bookmark status updated.'
    else
      redirect_to bookmarks_path, alert: "Unable to update bookmark"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to trip_path(@bookmark.trip), notice: "Bookmark removed."
    else
      render "trips/show", alert: "Unable to remove bookmark."
    end
  end

  private

  def bookmark_params
    # params.require(:bookmark).permit(:status)
    params.permit(:trip_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end

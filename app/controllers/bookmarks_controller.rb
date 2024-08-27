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
      flash[:success] = "Trip bookmarked !"
      redirect_to trip_path(@bookmark.trip)
    else
      flash[:alert] = "Unable to bookmark the trip"
      redirect_to trip_path(@bookmark.trip)
    end
  end

  def update
    @bookmark.status = params[:status]
    if @bookmark.save
      flash[:success] = "Trip status updated !"
      redirect_to bookmarks_path
    else
      flash[:alert] = "Unable to update the trip"
      redirect_to bookmarks_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

   # if @bookmark.destroy
     # redirect_to trip_path(@bookmark.trip), notice: "Bookmark removed."
   # else
      #render "trips/show", alert: "Unable to remove bookmark."
    
    if @bookmark.user == current_user
      @bookmark.destroy
      flash[:notice] = "Trip removed"
      redirect_to bookmarks_path
    else
      flash[:alert] = "Unable to remove the trip"
      redirect_to bookmarks_path
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

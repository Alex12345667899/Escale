class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    #ajax stimulus pour éviter le reload du redirect
  end

  def update
    # if @bookmark.update(bookmark_params)
    #   redirect_to @bookmark, notice: "bookmark was successfully updated.", status: :see_other
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  def destroy
    @bookmark.destroy
    #redirect_to bookmarks_url, notice: "bookmark was successfully destroyed.", status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:status)
  end
end

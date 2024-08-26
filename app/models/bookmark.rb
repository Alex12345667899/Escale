class Bookmark < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  enum :status, { not_done: 0, to_do: 1, done: 2 }

  after_update_commit :broadcast_bookmark

  private

  def broadcast_bookmark
    broadcast_append_to "done_bookmarks_#{self.user.id}",
                        partial: "bookmarks/done_bookmark",
                        locals: { bookmark: self }
    broadcast_remove_to "to_do_bookmarks_#{self.user.id}"
  end
end

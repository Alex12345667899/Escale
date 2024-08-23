class Bookmark < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  enum :status, { not_done: 0, to_do: 1, done: 2 }
end

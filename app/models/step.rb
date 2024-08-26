class Step < ApplicationRecord
  belongs_to :trip
  geocoded_by :title
  after_validation :geocode, if: :will_save_change_to_title?

  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
  validates :duration, presence: true
end

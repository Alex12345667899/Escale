class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  #validates :footprint, presence: true

  #before_save :set_total_duration, :set_footprint

  # private

  # def set_total_duration
  #   journey = (end_date - start_date).to_i
  #   full_duration = journey * self.offer.duration
  #   self.total_duration = full_duration
  # end

  # def set_footprint
  #   total_footprint = 0
  #   self.footprint = total_footprint
  # end
end

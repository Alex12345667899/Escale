class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :categories

  validates :title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description],
  using: {
    tsearch: { prefix: true }
  }
  #validates :footprint, presence: true

  #before_save :set_total_duration, :set_footprint

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  # private

  # def set_footprint
  #   total_footprint = 0
  #   self.footprint = total_footprint
  # end

  def set_total_distance_and_duration
    self.total_duration = 0
    self.total_distance = 0
    self.steps.each_with_index do |step, index|
      self.total_duration += step.duration
      if index > 0
        previous_step = self.steps[index-1]
        step.distance = Geocoder::Calculations.distance_between([step.latitude, step.longitude], [previous_step.latitude, previous_step.longitude])
      elsif index == 0
        step.distance = 0
      end
      step.save
      self.total_distance += step.distance
    end
    self.save
  end
end

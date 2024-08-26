class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :categories

  has_one_attached :photo

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

  # def set_total_duration
  #   journey = (end_date - start_date).to_i
  #   full_duration = journey * self.offer.duration
  #   self.total_duration = full_duration
  # end

  # def set_footprint
  #   total_footprint = 0
  #   self.footprint = total_footprint
  # end

  def filter_by_even_order
    self.steps.select { |step| step.order.even? }
  end

  def filter_by_odd_order
    self.steps.select { |step| step.order.odd? }
  end
end

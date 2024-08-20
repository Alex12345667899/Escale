class Trip < ApplicationRecord
  belongs_to :user
  #before_save :set_total_duration

  private

  # def set_total_duration
  #   journey = (end_date - start_date).to_i
  #   full_duration = journey * self.offer.duration
  #   self.total_duration = full_duration
  # end
end

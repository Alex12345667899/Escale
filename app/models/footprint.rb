class Footprint < ApplicationRecord
  belongs_to :trip
  belongs_to :transport
end

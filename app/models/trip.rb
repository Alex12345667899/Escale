class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, :reviews, :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  #validates :footprint, presence: true

end

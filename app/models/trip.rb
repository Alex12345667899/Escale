class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :categories
  has_many :footprints, dependent: :destroy

  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true

  require "open-uri"
  require "json"
  require "nokogiri"

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description],
  using: {
    tsearch: { prefix: true }
  }
  #validates :footprint, presence: true
  #before_save :set_total_duration, :set_footprint

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

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
    puts "trip distance and duration are set"
  end

  def set_footprint
    url = "https://impactco2.fr/api/v1/transport?km=#{self.total_distance}&displayAll=0&transports=2%2C%201%2C%204&ignoreRadiativeForcing=0&occupencyRate=1&includeConstruction=1&language=en"
    html_file = URI.open(url).read
    data = JSON.parse(html_file)
    data["data"].each_with_index do |element, index|
      if index == 0
        transport = Transport.find_or_create_by(name: "Plane")
      elsif index == 1
        transport = Transport.find_or_create_by(name: "Train")
      elsif index == 2
        transport = Transport.find_or_create_by(name: "Car")
      end
      Footprint.create(transport: transport, trip: self, value: element["value"].to_i)
      puts "trip footprint is set"
    end
  end

  def trainline
    # url = "https://www.trainline.fr/search/#{self.steps.first.title.split[0]}/#{self.steps.last.title.split[0]}"
    # html_file = URI.open(url).read
    # html_doc = Nokogiri::HTML.parse(html_file)
    # @data = html_doc
    @url = "https://www.trainline.fr/search/#{self.steps.first.title.split[0]}/#{self.steps.last.title.split[0]}"
  end
end

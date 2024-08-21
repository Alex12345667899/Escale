class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_trip

  private

  def set_new_trip
    @trip = Trip.new
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = Trip.all
    @categories = {
      "Capital Cities" => "https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBhcmlzfGVufDB8fDB8fHww",
      "Beach Escapes" => "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2h8ZW58MHx8MHx8fDA%3D",
      "Mountain Gateaways" => "https://images.unsplash.com/photo-1688368582790-d03a262d7470?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHJ1cmFsJTIwdmlsbGFnZXxlbnwwfHwwfHx8MA%3D%3D",
      "Rural Retreats" => "https://plus.unsplash.com/premium_photo-1673240367277-e1d394465b56?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8fDA%3D"
    }
  end

  def footprint
  end
end

class AddTotalDistanceToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :Total_distance, :integer
  end
end

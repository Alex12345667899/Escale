class ChangeTotalDistanceToTrips < ActiveRecord::Migration[7.1]
  def change
    rename_column :trips, :Total_distance, :total_distance
  end
end

class AddTotalDistanceToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :total_distance, :integer
  end
end

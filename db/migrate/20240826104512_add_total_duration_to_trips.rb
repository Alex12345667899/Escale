class AddTotalDurationToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :total_duration, :integer
  end
end

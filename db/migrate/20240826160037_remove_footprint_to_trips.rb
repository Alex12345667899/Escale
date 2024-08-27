class RemoveFootprintToTrips < ActiveRecord::Migration[7.1]
  def change
    remove_column :trips, :footprint
  end
end

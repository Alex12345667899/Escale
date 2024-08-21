class AddCategoryToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :category, :string
  end
end

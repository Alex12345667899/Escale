class AddDistanceToSteps < ActiveRecord::Migration[7.1]
  def change
    add_column :steps, :distance, :integer
  end
end

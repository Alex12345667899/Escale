class AddDefaultValueOrderToSteps < ActiveRecord::Migration[7.1]
  def change
    change_column :steps, :order, :integer, default: 0
  end
end

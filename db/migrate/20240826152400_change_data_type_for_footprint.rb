class ChangeDataTypeForFootprint < ActiveRecord::Migration[7.1]
  def change
    change_column(:trips, :footprint, :string)
  end
end

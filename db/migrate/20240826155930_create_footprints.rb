class CreateFootprints < ActiveRecord::Migration[7.1]
  def change
    create_table :footprints do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :transport, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end

class CreateTransports < ActiveRecord::Migration[7.1]
  def change
    create_table :transports do |t|
      t.string :name

      t.timestamps
    end
  end
end

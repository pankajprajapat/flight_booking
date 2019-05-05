class CreateSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_configurations do |t|
      t.references :plane, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :seats_in_row
      t.integer :number_of_rows
      t.integer :base_price

      t.timestamps
    end
  end
end

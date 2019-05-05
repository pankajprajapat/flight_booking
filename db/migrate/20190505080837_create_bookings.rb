class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flight, foreign_key: true
      t.references :seat_configuration, foreign_key: true 
      t.integer :row_number
      t.integer :seat_number
      t.string :pnr_number
      t.float :total_fare

      t.timestamps
    end
  end
end

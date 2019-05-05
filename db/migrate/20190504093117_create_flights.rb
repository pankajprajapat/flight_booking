class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :plane, foreign_key: true
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end

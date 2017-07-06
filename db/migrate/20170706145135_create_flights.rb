class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :departing
      t.integer :seats
      t.references :destination, foreign_key: { to_table: :airports }, index: true
      t.references :origin, foreign_key: { to_table: :airports }, index: true

      t.timestamps
    end
  end
end

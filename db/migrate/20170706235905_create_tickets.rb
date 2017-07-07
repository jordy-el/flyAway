class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :price
      t.references :flight, foreign_key: true
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end

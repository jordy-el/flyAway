class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :address
      t.string :phone
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end

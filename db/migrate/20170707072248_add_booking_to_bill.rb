class AddBookingToBill < ActiveRecord::Migration[5.1]
  def change
    add_reference :bills, :booking, foreign_key: true
  end
end

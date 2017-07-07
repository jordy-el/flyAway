class AddBookingToTicket < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :booking, foreign_key: true
  end
end

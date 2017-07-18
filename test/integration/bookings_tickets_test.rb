require 'test_helper'

class BookingsTicketsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @booking = Booking.create
    @bill = Bill.new(address: "asdasd", phone: "123123", email: "asdsad@asdsad.asdasd")
    @booking.bill = @bill
    @bill.save!
    @passenger = Passenger.create(name: "Jordan")
    @origin = Airport.create(location: "Melbourne")
    @destination = Airport.create(location: "Sydney")
    @flight = Flight.new(departing: DateTime.now, seats: 300)
    @flight.destination = @destination
    @flight.origin = @origin
    @flight.save
    @booking.tickets << @ticket = Ticket.new
    @ticket.price = 123
    @ticket.passenger = @passenger
    @ticket.flight = @flight
    @ticket.save!
  end

  test "ticket should show up in booking's tickets" do
    assert_includes(@booking.tickets, @ticket)
  end

  test "bill should show up in booking's bill" do
    assert_equal(@booking.bill, @bill)
  end
end

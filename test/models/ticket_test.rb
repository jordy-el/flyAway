require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @passenger = Passenger.create(name: "Jordan")
    @origin = Airport.create(location: "Melbourne")
    @destination = Airport.create(location: "Sydney")
    @flight = Flight.new(departing: DateTime.now, seats: 300)
    @flight.destination = @destination
    @flight.origin = @origin
    @flight.save
  end

  test "saves valid ticket" do
    ticket =  Ticket.new(price: 250)
    ticket.flight = @flight
    ticket.passenger = @passenger
    assert ticket.save
  end

  test "rejects missing price info" do
    ticket = Ticket.new
    ticket.flight = @flight
    ticket.passenger = @passenger
    assert_not ticket.save
  end
end

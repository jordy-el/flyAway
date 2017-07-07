require 'test_helper'

class TicketsFlightsPassengersTestTest < ActionDispatch::IntegrationTest
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
    @ticket =  Ticket.new(price: 250)
    @ticket.flight = @flight
    @ticket.passenger = @passenger
    @ticket.save
  end

  test "can find ticket in passenger's ticket list" do
    assert_includes(@passenger.tickets, @ticket)
  end

  test "can find ticket in flight's ticket list" do
    assert_includes(@flight.tickets, @ticket)
  end
end

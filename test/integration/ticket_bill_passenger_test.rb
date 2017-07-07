require 'test_helper'

class TicketBillPassengerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @passenger = Passenger.create(name: "Jordan")
    @bill = Bill.new(address: "42 Ferguson St Broadford", phone: "1234567890")
    @bill.passenger = @passenger
    @bill.save!
    @origin = Airport.create(location: "Melbourne")
    @destination = Airport.create(location: "Sydney")
    @flight = Flight.new(departing: DateTime.now, seats: 300)
    @flight.destination = @destination
    @flight.origin = @origin
    @flight.save!
    @ticket =  Ticket.new(price: 250)
    @ticket.flight = @flight
    @ticket.passenger = @passenger
    @ticket.save!
  end

  test "can get bill from ticket through passenger" do
    assert_equal(@ticket.bill, @bill)
  end
end

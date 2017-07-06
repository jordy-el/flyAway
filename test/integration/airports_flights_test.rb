require 'test_helper'

class AirportsFlightsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @origin = Airport.create(location: "Melbourne")
    @destination = Airport.create(location: "Sydney")
    @flight = Flight.new(departing: DateTime.now, seats: 300)
    @flight.origin = @origin
    @flight.destination = @destination
    @flight.save!
  end

  test "can extract origin from flight" do
    assert_equal(@flight.origin, @origin)
  end

  test "can extract destination from flight" do
    assert_equal(@flight.destination, @destination)
  end

  test "can find flight in origin airport's departure list" do
    assert_includes(@origin.departures, @flight)
  end

  test "can find flight in destination airport's arrival list" do
    assert_includes(@destination.arrivals, @flight)
  end
end

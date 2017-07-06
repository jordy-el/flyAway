require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @origin = Airport.create(location: "Melbourne")
    @destination = Airport.create(location: "Sydney")
  end

  test "saves valid flight" do
    assert Flight.new(departing: DateTime.now, seats: 300, origin_id: @origin.id, destination_id: @destination.id).save!
  end

  test "rejects missing date/time" do
    assert_not Flight.new(seats: 300, origin_id: @origin.id, destination_id: @destination.id).save
  end

  test "rejects missing seating information" do
    assert_not Flight.new(departing: DateTime.now, origin_id: @origin.id, destination_id: @destination.id).save
  end
end

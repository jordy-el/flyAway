require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ensures nameless is invalid" do
    assert_not Passenger.new.save
  end

  test "ensures named passenger is valid" do
    assert Passenger.new(name: "Jordan").save
  end
end

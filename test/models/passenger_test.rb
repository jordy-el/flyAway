require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ensures nameless is invalid" do
    passenger = passengers(:not_valid)
    assert_not passenger.save
  end

  test "ensures named passenger is valid" do
    passenger = passengers(:valid)
    assert passenger.save
  end
end

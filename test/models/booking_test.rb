require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save valid booking" do
    assert Booking.new.save!
  end
end

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save valid booking" do
    assert Booking.new(bill: Bill.create(address: "asdasd", phone: "234234", email: "asdasd@adasd.asdasd")).save!
  end
end

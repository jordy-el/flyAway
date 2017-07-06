require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @passenger = Passenger.create(name: "Jordan")
  end

  test "saves valid bill" do
    assert Bill.new(address: "12312312asdadsasd", phone: "132213123", passenger_id: @passenger.id).save!
  end

  test "rejects missing address" do
    assert_not Bill.new(phone: "123", passenger_id: @passenger.id).save
  end

  test "rejects missing phone number" do
    assert_not Bill.new(address: "asdasd", passenger_id: @passenger.id).save
  end

  test "rejects invalid phone number" do
    assert_not Bill.new(address: "asdasd", phone: "asdasd", passenger_id: @passenger.id).save
  end
end

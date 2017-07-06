require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "saves valid location" do
    assert Airport.new(location: "Melbourne").save!
  end

  test "rejects missing location" do
    assert_not Airport.new.save
  end

  test "rejects duplicate location" do
    Airport.new(location: "Melbourne").save!
    assert_not Airport.new(location: "Melbourne").save
  end
end

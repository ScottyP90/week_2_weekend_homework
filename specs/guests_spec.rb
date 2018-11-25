require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')

class GuestsTest < MiniTest::Test

  def setup
    @guest1 = Guests.new("Scotty", 26, 50.50, "Tribute")
    @guest2 = Guests.new("Amy", 25, 45.50, "One Week")
    @guest3 = Guests.new("Lewis", 26, 49.20, "When The Wild Wind Blows")
    @guest4 = Guests.new("Kim", 24, 50.00, "Paint It Black")
  end

  def test_guests_name
    result = @guest1.name
    assert_equal("Scotty", result)
  end

  def test_guests_age
    result = @guest2.age
    assert_equal(25, result)
  end

  def test_guests_money
    result = @guest3.money
    assert_equal(49.20, result)
  end

end

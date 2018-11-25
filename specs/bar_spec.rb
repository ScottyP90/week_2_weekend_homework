require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')

class BarTest < MiniTest::Test

  def setup
    @food1 = Bar.new("Hamburgger", 4.50)
    @food2 = Bar.new("Hotdog", 2.50)
    @food3 = Bar.new("Pizza", 10.00)
    @food4 = Bar.new("Ice cream", 2.00)
    @drink1 = Bar.new("Iron-Brew", 0.75)
    @drink2 = Bar.new("Coke-a-cola", 1.00)
    @drink3 = Bar.new("Beer", 2.00)
    @snack1 = Bar.new("Cholcolate bar", 0.75)
    @snack2 = Bar.new("Crisps", 0.80)
    @snack3 = Bar.new("Chips", 1.00)
  end

  def test_get_food_name
    result = @food1.food
    assert_equal("Hamburgger", result)
  end

  def test_get_food_price
    result = @food3.price
    assert_equal(10.00, result)
  end

  

end

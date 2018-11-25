require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../bar.rb')

class RoomsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Tribute", "Tenatious D")
    @song2 = Songs.new("Paint It Black", "The Rolling Stones")
    @song3 = Songs.new("One Week", "Barenaked Ladies")
    @song4 = Songs.new("When The Wild Wind Blows", "Iron Maiden")
    @song5 = Songs.new("Take Me Home, Country Roads", "John Denver")

    @guest1 = Guests.new("Scotty", 26, 50.50, "Tribute")
    @guest2 = Guests.new("Amy", 25, 45.50, "One Week")
    @guest3 = Guests.new("Lewis", 26, 49.20, "When The Wild Wind Blows")
    @guest4 = Guests.new("Kim", 24, 50.00, "Paint It Black")
    @guest5 = Guests.new("Mark", 21, 5.00, "Song 2")

    @food1 = Bar.new("Hamburgger", 4.50)
    @food2 = Bar.new("Hotdog", 2.50)
    @food3 = Bar.new("Pizza", 10.00)
    @food4 = Bar.new("Ice cream", 2.00)
    @drink1 = Bar.new("Iron-Brew", 0.75)
    @drink2 = Bar.new("Coke-a-cola", 1.00)
    @drink3 = Bar.new("Beer", 2.00)

    @room1 = Rooms.new("Standard Room", 4, 7.50)
    @room2 = Rooms.new("Large Room", 6, 12.00)
    @room3 = Rooms.new("Luxury Room", 7, 15.00)
  end

  def test_get_room_name
    result = @room1.room
    assert_equal("Standard Room", result)
  end

  def test_room_ocupant_count
    result = @room1.ocupants_count
    assert_equal(0, result)
  end

  def test_check_playlist
    result = @room1.playlist_count
    assert_equal(0, result)
  end

  def test_room_cost
    result = @room1.room_cost
    assert_equal(7.50, result)
  end

  def test_add_person_to_room
    @room1.add_to_room(@guest1)
    result = @room1.ocupants_count
    assert_equal(1, result)
  end

  def test_add_group_to_room
    @room1.add_to_room(@guest1)
    @room1.add_to_room(@guest2)
    @room1.add_to_room(@guest3)
    @room1.add_to_room(@guest4)
    result = @room1.ocupants_count
    assert_equal(4, result)
  end

  def test_remove_person_from_room
    @room1.add_to_room(@guest1)
    @room1.remove_from_room(@guest1)
    result = @room1.ocupants_count
    assert_equal(0, result)
  end

  def test_add_to_playlist
    @room1.add_to_playlist(@song1)
    result = @room1.playlist_count
    assert_equal(1, result)
  end

  def test_max_ocupancy
    @room1.add_to_room(@guest1)
    @room1.add_to_room(@guest2)
    @room1.add_to_room(@guest3)
    @room1.add_to_room(@guest4)
    result = @room1.is_there_room?(@room1, @guest5)
    assert_equal("Room is full, please try another room", result)
  end

  def test_room_for_one_more
    @room1.add_to_room(@guest1)
    @room1.add_to_room(@guest2)
    @room1.add_to_room(@guest3)
    @room1.is_there_room?(@room1, @guest4)
    result = @room1.ocupants_count
    assert_equal(4,result)
  end

  def test_pay_for_room
    @room1.add_to_room(@guest1)
    @room1.pay_for_room(@guest1)
    result = @guest1.money
    assert_equal(43.00, result)
  end

  def test_pay_for_room_2
    @room2.add_to_room(@guest1)
    @room2.pay_for_room(@guest1)
    result = @guest1.money
    assert_equal(38.50, result)
  end

  def test_I_will_pay_for_the_room
    @room1.pay_for_your_room(@room1,@guest1)
    result = @room1.ocupants_count
    result2 = @guest1.money
    assert_equal(1,result)
    assert_equal(43.00, result2)
  end

  def test_I_will_not_pay_for_the_room
    @room1.pay_for_your_room(@room1,@guest5)
    result = @room1.ocupants_count
    result2 = @guest5.money
    assert_equal(0,result)
    assert_equal(5.00, result2)
  end

  # def test_favorite_song
  #   @room1.add_to_room(@guest1)
  #   @room1.add_to_playlist(@song2)
  #   @room1.add_to_playlist(@song1)
  #   result = @room1.this_is_my_song(@guest1)
  #   assert_equal("Whooo!", result)
  # end
  #
  # def test_favorite_song_not_listed
  #   @room1.add_to_room(@guest2)
  #   @room1.add_to_playlist(@song1)
  #   result = @room1.this_is_my_song(@guest2)
  #   assert_equal([], result)
  # end

  def test_pay_for_room_3
    @room1.add_to_room(@guest1)
    @room1.admin_fee_to_room(@room1, @guest1)
    result = @guest1.money
    result2 = @room1.total_spent
    assert_equal(43.00, result)
    assert_equal(7.50, result2)
  end

  def test_order_food
    @room1.order_food(@room1,@guest1,@food1)
    result = @guest1.money
    result2 = @room1.total_spent
    assert_equal(46.00, result)
    assert_equal(4.50, result2)
  end

  def test_mass_order_food
    @room1.order_food(@room1,@guest1,@food1)
    @room1.order_food(@room1,@guest1,@food2)
    result = @guest1.money
    result2 = @room1.total_spent
    assert_equal(43.50, result)
    assert_equal(7.00, result2)
  end
  
end

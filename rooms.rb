class Rooms

  attr_reader :room, :max_ocupancy, :room_cost, :ocupants, :playlist

  attr_accessor :total_spent

  def initialize(room,max_ocupancy,room_cost)
    @room = room
    @max_ocupancy = max_ocupancy
    @room_cost = room_cost
    @ocupants = []
    @playlist = []
    @total_spent = 0
  end

  def ocupants_count
    return @ocupants.count
  end

  def playlist_count
    return @playlist.count
  end

  def add_to_room(guest)
    @ocupants << guest
  end

  def remove_from_room(guest)
    @ocupants.delete(guest)
  end

  def add_to_playlist(song)
    @playlist << song
  end

  def is_there_room?(room,customer)
    if (@ocupants.count == room.max_ocupancy)
      return "Room is full, please try another room"
    end
    return room.add_to_room(customer)
  end

  def pay_for_room(guest)
    guest.money -= @room_cost
  end

  def pay_for_your_room(room,guest)
    if (guest.money >= room.room_cost)
      room.add_to_room(guest)
      room.pay_for_room(guest)
    end
    return "You don't have enough money"
  end

  # def this_is_my_song(guest)
  #   @playlist.find{|songs| songs.song == guest.best_song}
  #
  #
  # end

  def admin_fee_to_room(room,guest)
    guest.money -= @room_cost
    room.total_spent += @room_cost
  end

  def order_food(room,guest,food)
    guest.money -= food.price
    room.total_spent += food.price
  end


end

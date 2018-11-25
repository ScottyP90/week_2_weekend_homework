class Guests

  attr_reader :name, :age, :best_song

  attr_accessor :money

  def initialize(name, age, money, best_song)
    @name = name
    @age = age
    @money = money
    @best_song = best_song
  end

end

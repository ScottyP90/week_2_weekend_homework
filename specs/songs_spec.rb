require('minitest/autorun')
require('minitest/rg')
require_relative('../songs.rb')

class SongsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Tribute", "Tenatious D")
    @song2 = Songs.new("Paint It Black", "The Rolling Stones")
    @song3 = Songs.new("Feel Good Inc", "Gorillaz")
  end

  def test_song_name
    result = @song1.song
    assert_equal("Tribute", result)
  end

  def test_artist_name
    result = @song2.artist
    assert_equal("The Rolling Stones", result)
  end


end

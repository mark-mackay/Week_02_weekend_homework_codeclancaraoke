require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

    def setup
      @song_1 = Song.new({name:"What's the story", artist:"Oasis"})
      @song_2 = Song.new({name:"Song 2", artist:"Blur"})
      @song_3 = Song.new({name:"Narayan", artist:"The Prodigy"})
      @song_4 = Song.new({name:"The sound of silence", artist:"Disturbed"})
      @song_5 = Song.new({name:"Summer Time!", artist:"Will Smith"})
      @song_6 = Song.new({name:"Coming in the air tonight", artist:"Phil Collins"})
      @song_7 = Song.new({name:"Secret Smile", artist:"Semisonic"})
      @song_8 = Song.new({name:"Rock You", artist:"Queen"})
      @song_9 = Song.new({name:"Hide and seek", artist:"Howard Jones"})
      @song_10 = Song.new({name:"Scary monsters and nice sprites", artist:"Skrillex"})
      @song_11 = Song.new({name:"Battleflag", artist:"Lo fidelity allstars"})
    end

    def test_get_song_name
      # Checks song has a name
      assert_equal("What's the story", @song_1.name)
    end
    def test_get_song_artist
      # Checks song artist.
      assert_equal("Queen", @song_8.artist)
    end


end

require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../karoake_bar')


class TestKaroakeBar < Minitest::Test

    def setup
      @person_1 = Guest.new(name: "Mark", wallet: 29.86, fav_song: "Rock You" )
      @person_2 = Guest.new(name: "Tracy", wallet: 3.60, fav_song: "Secret Smile" )
      @person_3 = Guest.new(name: "Katie", wallet: 100.50, fav_song: "Coming in the air tonight" )
      @person_4 = Guest.new(name: "Amy", wallet: 56.72, fav_song: "Hide and seek" )
      @person_5 = Guest.new(name: "Ozzy", wallet: 98.98, fav_song: "Summer Time!" )
      @person_6 = Guest.new(name: "Pepe", wallet: 10.79, fav_song: "The sound of silence" )
      @person_7 = Guest.new(name: "Derek", wallet: 1.50, fav_song: "Narayan" )
      @person_8 = Guest.new(name: "Colin", wallet: 23.56, fav_song: "What's the story" )
      @person_9 = Guest.new(name: "Henry", wallet: 17.45, fav_song: "Song 2" )
      @person_10 = Guest.new(name: "Alice", wallet: 21.08, fav_song: "Battleflag" )
      @person_11 = Guest.new(name: "Joe", wallet: 26.74, fav_song: "Scary monsters and nice sprites" )
      @guests_1 = [@person_1, @person_2, @person_3, @person_4, @person_5]
      @guests_2 = [@person_6, @person_7, @person_8, @person_9, @person_10, @person_11]
      @bar = Karaoke_Bar.new("CodeClan Caraoke", @guests_1)


      @red_room =  Room.new("Red Room", 3.50, [], @album, 5, 0.0)
      @blue_room = Room.new("Blue Room", 4.50, [], @album, 5, 0.0)
      @green_room = Room.new("Green Room", 2.50, [], @album, 5, 0.0)
      @yellow_room = Room.new("Yellow Room", 3.00, [], @album, 5, 0.0)
      @orange_room = Room.new("Orange Room", 5.50, [], @album, 5, 0.0)
      @rooms = [@red_room, @blue_room, @green_room, @yellow_room, @orange_room]

      @bar_2 = Karaoke_Bar.new("CodeClan Caraoke", @guests)
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
      @album = [@song_1, @song_2, @song_3, @song_4, @song_5, @song_6, @song_7, @song_8, @song_9, @song_10, @song_11]
    end

    def test_get_bar_name
      assert_equal("CodeClan Caraoke", @bar.name)
    end
    def test_get_rooms
      assert_equal("Queen", @bar.rooms)
    end


end

require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test
# room specs (name, cost, guests = [{:guest => "", :spending => 0.0}],songs = [], capacity = 10, float = 0.0 )
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
      @people = [@person_1, @person_2, @person_3, @person_4, @person_5, @person_6, @person_7, @person_8, @person_9, @person_10, @person_11]
      @guests_1 = [@person_8, @person_9]
      @guests_2 = [@person_10, @person_11]
      @guests_3 = [@person_3, @person_4, @person_5, @person_6, @person_7]
      @guests_4 = [@person_1, @person_2]
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
      @album_1 = [@song_1, @song_2, @song_3, @song_4, @song_5]
      @album_2 = [@song_6, @song_7, @song_8, @song_9, @song_10]
      @lobby = Room.new("Lobby", 0.0,  @people, [], 500, 0.0)
      @red_room =  Room.new("Red Room", 3.50, @guests_1, @album_1, 5, 0.0)
      @blue_room = Room.new("Blue Room", 4.50, @guests_2, @album_2, 5, 0.0)
      @green_room = Room.new("Green Room", 2.50, @guests_3, @album_1, 5, 0.0)
      @yellow_room = Room.new("Yellow Room", 3.00, @guests_4, @album_2, 5, 0.0)
      @orange_room = Room.new("Orange Room", 5.50, @guests_2, @album_1, 5, 0.0)
    end


    def test_get_room_name
      assert_equal("Red Room",@red_room.name)
    end

    def test_get_room_cost
      assert_equal(4.50, @blue_room.cost)
    end
    def test_add_guest_to_room__room_has_guests
        @red_room.add_guest(@person_1)
        assert_equal(26.36, @person_1.wallet) # Make sure funds have been taken
        assert_equal(3.50, @red_room.float) # Make sure funds have gone to room float
        assert_equal(3, @red_room.get_number_of_guests_in_room)  # Check number of guests
    end

    def test_add_guest_to_room__room_has_guest_already
        result = @red_room.add_guest(@person_8)
        assert_equal(23.56, @person_8.wallet) # Make sure funds have been taken
        assert_equal(0.00, @red_room.float) # Make sure funds have gone to room float
        assert_equal(2, @red_room.get_number_of_guests_in_room)  # Check number of guests
        assert_equal("Guest is already in room or doesn't have enough funds.", result)
    end


    def test_if_guest_in_room__person_there
            result = @red_room.guest_in_room(@person_8)
            assert_equal(true, result)
    end

    def test_if_guest_in_room__not_there
            result = @red_room.guest_in_room(@person_2)
            assert_equal(false, result)
    end

    def test_remove_person_from_room__person_there
        @red_room.remove_guest(@person_8)
        assert_equal(1, @red_room.get_number_of_guests_in_room)
    end

    def test_remove_person_from_room__person_not_there
        @red_room.remove_guest(@person_1)
        assert_equal(2, @red_room.get_number_of_guests_in_room)
    end

    def test_room_includes_favourite_song
      result = @blue_room.add_guest(@person_1)
      assert_equal("Whoop! Whoop!, Favourite Song!!!", result)
    end

    #
    #   p @lobby.get_number_of_guests_in_room
    #   # @person_1.move_room(@red_room)
    #   p @red_room.get_number_of_guests_in_room
    #   p @lobby.get_number_of_guests_in_room
    #   # @red_room.add_guest(@guests_1)
    #   # assert_equal()
    def test_add_song_to_room
      @blue_room.add_song(@song_2)
      assert_equal(true, @blue_room.song_in_room(@song_2))
    end

    def test_add_song_to_room__song_already_there
      result = @blue_room.add_song(@song_8)
      assert_equal("Song is already in room.", result)
    end
    # def test_remove_guest_from_room
    #
    # end



end
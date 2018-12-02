require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require_relative('../drink')

class TestRoom < Minitest::Test
# room specs (name, cost, guests = [{:guest => "", :spending => 0.0}],songs = [], capacity = 10, float = 0.0, drinks = [] )
    def setup
      # Stolen from drink solution!
      @drink1 = Drink.new("beer", 2.0, 5)
      @drink2 = Drink.new("wine", 3.0, 10)
      @drink3 = Drink.new("gin", 4.0, 30)
      @drinks = [@drink1, @drink2, @drink3]
      # End of stolen bit!
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
      @green_room = Room.new("Green Room", 2.50, @guests_3, @album_1, 5, 0.0, @drinks)
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
      # Tests adding a guest to a room with guests 
        @red_room.add_guest(@person_1)
        assert_equal(26.36, @person_1.wallet) # Make sure funds have been taken
        assert_equal(3.50, @red_room.float) # Make sure funds have gone to room float
        assert_equal(3, @red_room.get_number_of_guests_in_room)  # Check number of guests
    end

    def test_add_guest_to_room__room_has_guest_already
      # Tests adding a person to the room when they are already there.
        result = @red_room.add_guest(@person_8)
        assert_equal(23.56, @person_8.wallet) # Make sure funds have not been taken
        assert_equal(0.00, @red_room.float) # Make sure funds have not gone to room float
        assert_equal(2, @red_room.get_number_of_guests_in_room)  # Check number of guests
        assert_equal("Guest is already in room or doesn't have enough funds.", result)
    end

    def test_adding_guest_to_room_room_at_capactity
      # Tests that nobody can be added to the room when it is at capacity.
      result = @green_room.add_guest(@person_1)
      assert_equal(5, @green_room.get_number_of_guests_in_room) # 5 if guest has not been added.
      assert_equal("Room is full!", result) # Checks message is returned.
    end


    def test_if_guest_in_room__person_there
      # Tests if a person is in the room when they are there
            result = @red_room.guest_in_room(@person_8)
            assert_equal(true, result)
    end

    def test_if_guest_in_room__not_there
      # Tests if a person is in the room when they are not there
            result = @red_room.guest_in_room(@person_2)
            assert_equal(false, result)
    end

    def test_remove_person_from_room__person_there
      # Tests removing a person from the room who is there.
        @red_room.remove_guest(@person_8)
        assert_equal(1, @red_room.get_number_of_guests_in_room)
    end

    def test_remove_person_from_room__person_not_there
      # Tests removing a person from the room who isn't there.
        @red_room.remove_guest(@person_1)
        assert_equal(2, @red_room.get_number_of_guests_in_room)
    end

    def test_room_includes_favourite_song
      # Tests adding a guest to the room
      result = @blue_room.add_guest(@person_1)
      assert_equal("Whoop! Whoop!, Favourite Song!!!", result)
    end


    def test_add_song_to_room
      # Tests adding a song to the room
      @blue_room.add_song(@song_2)
      assert_equal(true, @blue_room.song_in_room(@song_2))
    end

    def test_add_song_to_room__song_already_there
      # Tests adding a song when song is already in room.
      result = @blue_room.add_song(@song_8)
      assert_equal("Song is already in room.", result)
    end

    def test_take_request_by_name__song_is_in_room
        # Checks the song is in the room by name when the song is there.
        result = @yellow_room.take_request_by_name("Scary monsters and nice sprites")
        assert_equal("Amazing! we have that song!", result)
    end
    def test_take_request_by_name__do_not_have_song
      # Checks the song is in the room by name when the song isn't there.
        result = @yellow_room.take_request_by_name("Blame it on the rain!")
        assert_equal("We do not have that song!", result)
    end

    def test_customer_can_buy_drink__enough_funds
      # Tests funds are taken after serving guest a drink
      @green_room.serve_drink(@person_3, "gin")
      assert_equal(96.50, @person_3.wallet)
    end

    def test_customer_can_buy_drink__not_enough_funds
      # returns a message if customer doesn't have enough funds.
      result = @green_room.serve_drink(@person_7, "gin")
      assert_equal("Guest doesn't have enough funds.", result)
      assert_equal(1.50, @person_7.wallet)
    end
    def test_customer_can_buy_drink__drink_doesnt_exist
      # Tests no funds are taken if drink doesn't exist
      result = @green_room.serve_drink(@person_3, "absynth")
      assert_equal(100.50, @person_3.wallet)
      assert_equal("Drink is not in bar", result)
    end
end

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class TestGuest < Minitest::Test


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
    end

    def test_get_guest_name
      assert_equal("Mark", @person_1.name)
    end

    def test_show_guest_money
      assert_equal(23.56, @person_8.wallet)
    end

    def test_get_fav_song
      assert_equal("Battleflag", @person_10.fav_song)
    end

    def test_check_money__has_enough
      result = @person_6.check_money(10.78)
      assert_equal(result, true )
    end
    def test_check_money__not_enough
      result = @person_2.check_money(10.78)
      assert_equal(result, false )
    end

    def test_take_money__enough_funds
      @person_5.take_money(51.26)
      assert_equal(47.72, @person_5.wallet.round(2)) # Had to change this to round as returned 47.720000000000006, why??????
    end
    def test_take_money__not_enough_funds
      # Should only take money if enough funds otherwise no...
      @person_5.take_money(102.26)
      assert_equal(1.50, @person_7.wallet)
    end

    def test_guest_can_whoop
      result = @person_5.whoop
      assert_equal("Whoop! Whoop!, Favourite Song!!!", result)
    end






end

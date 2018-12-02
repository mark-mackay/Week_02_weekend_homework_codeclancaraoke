class Room
  attr_reader :name, :capacity, :float, :cost, :was_in_room, :drinks
  attr_accessor :songs, :guests

  def initialize(name, cost, guests = [],songs = [], capacity = 7, float = 0.0, drinks = [] )
    @name = name
    @guests = guests
    @cost = cost
    @songs = songs
    @float = float
    @capacity = capacity
    @was_in_room = guests.map {|guest| guest.name }
    @drinks = drinks
  end

  def get_number_of_guests_in_room
    # Returns number of guests in room
    return @guests.length
  end

  def guest_in_room(guest)
    # Returns true if guest is in room
    return @guests.include?(guest)
  end

  def list_includes_favourite(guest)
    # returns true if favourite song is in room
    song_names = @songs.map { |song| song.name }
    song_names.include?(guest.fav_song)
  end

  def add_guest(guest)
    # adds guest to room, it they are not already in there and they have the fee
    if !guest_in_room(guest) && guest.check_money(@cost)
      @guests << guest
      guest.take_money(@cost)
      @float += @cost
      guest.whoop if list_includes_favourite(guest)
    else
      return "Guest is already in room or doesn't have enough funds."
    end
  end
  def serve_drink(guest, beverage)
    # Guest buys a drink if they have the funds
      drink_hash = @drinks.find { |drink| drink.name == beverage }
       if !drink_hash.nil?
        if guest.check_money(drink_hash.price)
          guest.take_money(drink_hash.price)
          @float += drink_hash.price
        else
          return "Guest doesn't have enough funds."
        end
      else
        return "Drink is not in bar"
      end 
  end
  def remove_guest(guest)
    guests.delete(guest) if guest_in_room(guest)
  end

  def song_in_room(song)
    # Returns true if song is in room
    return @songs.include?(song)
  end

  def add_song(song)
    # adds song to room
   song_in_room(song) ? "Song is already in room." : @songs << song
  end
  def take_request_by_name(song_name)
    # Takes name of song and plays it if we have it..
    result = @songs.find { |song| song.name == song_name }
    result.nil? ? "We do not have that song!" : "Amazing! we have that song!"
  end
end

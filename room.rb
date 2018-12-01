class Room
  attr_reader :name, :capacity, :float, :cost, :was_in_room
  attr_accessor :songs, :guests

  def initialize(name, cost, guests = [],songs = [], capacity = 7, float = 0.0 )
    @name = name
    @guests = guests
    @cost = cost
    @songs = songs
    @float = float
    @capacity = capacity
    @was_in_room = guests.map {|guest| guest.name }
  end

  def get_number_of_guests_in_room
    return @guests.length
  end

  def guest_in_room(guest)
    return @guests.include?(guest)
  end

  def list_includes_favourite(guest)
    song_names = @songs.map { |song| song.name }
    song_names.include?(guest.fav_song)
  end

  def add_guest(guest)
    if !guest_in_room(guest) && guest.check_money(@cost)
      @guests << guest
      guest.take_money(@cost)
      @float += @cost
      guest.whoop if list_includes_favourite(guest)
    else
      return "Guest is already in room or doesn't have enough funds."
    end
  end
  def remove_guest(guest)
    guests.delete(guest) if guest_in_room(guest)
  end

  def song_in_room(song)
    return @songs.include?(song)
  end

  def add_song(song)
   song_in_room(song) ? "Song is already in room." : @songs << song
  end
  def take_request_by_name(song_name)
    result = @songs.find { |song| song.name == song_name }
    result.nil? ? "We do not have that song!" : "Amazing! we have that song!"

  end
end

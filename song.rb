class Song
  attr_reader :name, :artist
# Takes a song hash and initialises the two elements, artist and name 
  def initialize(song_hash)
    @name = song_hash[:name]
    @artist =  song_hash[:artist]
  end

end

class Song
  attr_reader :name, :artist

  def initialize(song_hash)
    @name = song_hash[:name]
    @artist =  song_hash[:artist]
  end

end

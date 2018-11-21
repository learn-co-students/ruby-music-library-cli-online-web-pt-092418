class Genre
  extend Concerns::Findable


  attr_accessor :name, :artist
  @@all = []

 def initialize(name)
    @name = name
    @@all
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre_name)
   genre = self.new(genre_name)
   genre.save
   genre
 end

 def songs
   @songs
 end

 def add_song(song)
    songs << song unless songs.include?(song)
    song.genre = self unless song.genre
 end

 def artists
   # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
   #       does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
   #       collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end

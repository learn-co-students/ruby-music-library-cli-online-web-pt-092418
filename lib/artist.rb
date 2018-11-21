class Artist
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :songs
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

  def self.create(name)
   artist = self.new(name)
   artist.save
   artist
 end

 def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist
 end

 def genres
   # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
   #    does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
   #    collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
   #
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

end

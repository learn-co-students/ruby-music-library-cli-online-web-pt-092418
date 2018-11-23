class Artist
<<<<<<< HEAD
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :songs
  @@all = []

 def initialize(name)
    @name = name
    @@all
    @songs = []
end
=======

  extend Concerns::Findable
    attr_accessor :name, :songs, :genre
    @@all = []

  def initialize(artist)
    @name = artist
    @songs = []
  end
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371

  def self.all
    @@all
  end

  def self.destroy_all
<<<<<<< HEAD
    @@all.clear
=======
    self.all.clear
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
  end

  def save
    @@all << self
  end

  def self.create(name)
<<<<<<< HEAD
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
=======
    artist = self.new(artist)
    artist.save
    artist
  end

  def songs
    @songs
  end

 #this sets up the song belongs to the artist association
  def add_song(song_object)
    song_object.artist = self unless song_object.artist == self
    @songs << song_object unless @songs.include?(song_object)
  end

  #artist has many genres through songs
  def genres
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

<<<<<<< HEAD
=======

>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
end

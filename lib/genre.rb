class Genre
  extend Concerns::Findable
<<<<<<< HEAD


  attr_accessor :name, :artist
  @@all = []

 def initialize(name)
    @name = name
    @@all
=======
  attr_accessor :name
  attr_reader :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
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

<<<<<<< HEAD
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
=======
  # def self.create(name)
  #   self.new(name).tap do |genre|
  #     genre.save
  #   end
  # end

  def self.create(name)
    # initializes, saves, and returns the song
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end


  def artists
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end

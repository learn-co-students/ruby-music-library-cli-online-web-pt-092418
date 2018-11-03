class Artist

  extend Concerns::Findable
    attr_accessor :name, :songs, :genre
    @@all = []

  def initialize(artist)
    @name = artist
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
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
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end


end

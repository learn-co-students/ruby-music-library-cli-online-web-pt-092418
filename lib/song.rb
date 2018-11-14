require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre= genre if genre != nil
    self.artist= artist if artist != nil
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end
end

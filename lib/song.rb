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
  def self.new_from_filename(fname)
    f = fname.split(" - ")
    g = Genre.find_or_create_by_name(f[2].split(/\b.mp3/)[-1])
    a = Artist.find_or_create_by_name(f[0])
    s = Song.new(f[1], a, g)
  end
  def self.create_from_filename(fname)
    self.new_from_filename(fname).save
  end
end

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
  def self.new_from_filename(name)
    artist = Artist.find_or_create_by_name(name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(name.split(/\b.mp3|\s/)[-1])
    song = Song.new(name.split(" - ")[1], artist, genre)
  end
  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end

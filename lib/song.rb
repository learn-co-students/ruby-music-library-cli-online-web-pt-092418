require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

@@all = []

def initialize(name, artist_obj=nil, genre_obj=nil)
    @name = name
    self.genre=(genre_obj) if genre_obj != nil
    self.artist=(artist_obj) if artist_obj != nil
end

def self.all
  @@all
end

def self.destroy_all
  all.clear
end

def save
  self.class.all << self
end

def self.create(name, artist_obj=nil, genre_obj=nil)
  song = self.new(name, artist_obj, genre_obj)
  song.save
  song
end

def artist=(artist_obj)
  @artist = artist_obj
  artist_obj.add_song(self)
end

def genre=(genre_obj)
  @genre = genre_obj
  genre_obj.add_song(self)
end

def self.find_by_name(song_name)
  self.all.find { |x| x.name === song_name  }
end

def self.find_or_create_by_name(song_name)
  find_by_name(song_name) || create(song_name)
end

def self.new_from_filename(filename)
  filename_new = filename.split(" - ")
  artist_obj = Artist.find_or_create_by_name(filename_new[0])
  genre_obj = Genre.find_or_create_by_name(filename_new[2].gsub(".mp3",""))
  song = self.create(filename_new[1], artist_obj, genre_obj)
end

def self.create_from_filename(filename)
  self.new_from_filename(filename)
end

end

class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

@@all = []

def initialize(name)
    @name = name
    @songs = []
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

def self.create(genre_name)
  genre = self.new(genre_name)
  genre.save
  genre
end

def add_song(song_obj)
  @songs << song_obj unless @songs.include?(song_obj)
  song_obj.genre ||= self
  end

def artists
  self.songs.collect { |song_obj| song_obj.artist }.uniq
end

def self.find_by_name(genre_name)
    self.all.find {|x| x.name == genre_name}
end

def self.find_or_create_by_name(genre_name)
  find_by_name(genre_name) || create(genre_name)
end
end

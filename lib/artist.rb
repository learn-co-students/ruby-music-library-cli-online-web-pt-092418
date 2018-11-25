class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

@@all = []

def genres
  self.songs.collect { |song_obj| song_obj.genre }.uniq
end
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

def self.create(name)
    artist = self.new(name)
    artist.save
    artist
end

def self.find_by_name(artist_name)
    self.all.find {|x| x.name == artist_name}
end

def self.find_or_create_by_name(artist_name)
  find_by_name(artist_name) || create(artist_name)
end

def add_song(song_obj)
  @songs << song_obj unless @songs.include?(song_obj)
  song_obj.artist ||= self
  end
end

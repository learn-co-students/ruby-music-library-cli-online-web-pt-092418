class Artist
  attr_accessor :name, :songs 
  @@all = []
  
  def initialize(artist)
    @name = artist
    @songs = []
    
  end

  def self.all
    @@all
  end
  
  def save 
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end
  
  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end
  
  def add_song(song_obj)
    @songs << song_obj unless @songs.include?(song_obj)
    
    song_obj.artist ||= self
  end
  def genres
    self.songs.collect do |song_obj| 
      song_obj.genre
    end.uniq
  end 
end
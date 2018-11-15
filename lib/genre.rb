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
    all.clear
  end
  
  def save
    self.class.all.push(self)
  end
  
  def add_song(song_obj)
    @songs.push(song_obj) unless @songs.include?(song_obj)
  end
  
  def artists
    self.songs.collect {|song_obj| song_obj.artist}.uniq
  end
end
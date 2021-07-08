#asociations Arist has_many songs & Artist has_many Genres through Songs, Artist has _many Songs that have many Genres
class Artist
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def genres
    # self.songs.collect do |song_obj| 
    #   song_obj.genre 
    # end.uniq

    self.songs.collect {|song_obj| song_obj.genre}.uniq
  end
  
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
    @@all.push(self)
  end
  
  def add_song(song_obj)
    # song_obj.artist == self || song_obj.artist = self
    # below is better because artist is default to nil in song class so check if nil then run other side

    song_obj.artist || song_obj.artist = self

    @songs.push(song_obj) unless @songs.include?(song_obj)
  end
end
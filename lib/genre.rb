class Genre
attr_accessor :name, :songs
 
  extend Concerns::Findable
  @@all = []
 
    def initialize (name)
     @name = name 
     @@all << self
     @songs = []
    end
    
    def self.all 
      @@all
    end

    def save
      self.class.all << self
    end
  def self.destroy_all
    @@all.clear
  end 

  # def self.create(name)
  #   new_genre = self.new(name)
  #   new_genre.save
  #   new_genre
  # end
  def songs
    @songs
  end
  def add_song(song_obj)
    @songs.push(song_obj) unless @songs.include?(song_obj)
  end
  def artists
    self.songs.collect{|song_obj| song_obj.artist}.uniq
  end
end
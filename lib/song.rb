class Song
 attr_accessor :name
 attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre_obj = nil)
    @name = name
    self.artist = artist
    @genre = genre_obj
    self.genre=(genre_obj) if genre_obj != nil
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    create_song = self.new(name)
    create_song.save
    create_song
  end
  
  def artist=(the_artist)
    @artist = the_artist
    if @artist 
       @artist.add_song(self)
    end
    @artist
  end

  def genre=(genre_obj)
    @genre = genre_obj
    if @genre
    @genre.add_song(self)
    end
    @genre
  end
end
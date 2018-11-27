require 'pry'
class Song
 attr_accessor :name
 attr_reader :artist, :genre
  
  extend Concerns::Findable

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

  # def self.create(name)
  #   song = find_by_name(name)

  #   if !song
  #     song = self.new(name)
  #     song.save
  #   end

  #   song
  # end
  
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
  # def self.find_by_name(song_name)
  #   self.all.find { |x_name| x_name.name == song_name }
  # end


  # def self.find_or_create_by_name(song_name)
  #  find_by_name(song_name) || create(song_name)
  # end

  def self.new_from_filename(filename)
    new_string = filename.split(" - ")
    artist_string = new_string[0]
    artist_object = Artist.find_or_create_by_name(artist_string)
    new_song = new_string[1]
    song_object = self.new(new_song)
    song_object.artist = artist_object
    artist_object.songs << song_object
    genre_string = new_string[2].split(/.mp3/)[0]
    genre_object = Genre.find_or_create_by_name(genre_string)
    song_object.genre = genre_object
    song_object
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename).save
    new_song
    
  end

end
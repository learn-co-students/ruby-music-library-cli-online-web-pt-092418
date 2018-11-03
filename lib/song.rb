class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_obj=nil, genre_obj=nil)
    @name = name
    self.artist= artist_obj if artist_obj !=nil
    self.genre= genre_obj if genre_obj !=nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    # self.class.all << self
    self.class.all.push(self)
  end

  def self.create(name)
    # initializes, saves, and returns the song
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist_obj)
    # #artist=
    #   assigns an artist to the song (song belongs to artist) (FAILED - 1)
    @artist = artist_obj
    # artist_obj.songs.push(self) unless artist_obj.songs.include?(self)
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    # adds the song to the genre's collection of songs (genre has many songs)
    @genre = genre_obj
    genre_obj.add_song(self)
  end

  # def self.find_by_name(name)
  #   @@all.find do |song|
  #       song.name == name
  #   end
  # end

  def self.find_by_name(name)
   @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end

  def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end

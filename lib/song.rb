class Song
  extend Concerns::Findable

<<<<<<< HEAD

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_object=nil, genre_object=nil)
    @name = name
    self.artist= artist_object if artist_object !=nil
    #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initializatio
    self.genre= genre_object if genre_object !=nil
=======
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_obj=nil, genre_obj=nil)
    @name = name
    self.artist= artist_obj if artist_obj !=nil
    self.genre= genre_obj if genre_obj !=nil
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
<<<<<<< HEAD
    @@all << self
  end

  def self.create(name)
   # initializes, saves, and returns the song
   song = self.new(name)
   song.save
   song
 end


 def artist=(artist_object)
   #assigns an artist to the song (song belongs to artist)
   @artist = artist_object
   artist_object.add_song(self)
 end

 def genre=(genre_object)
   #assigns a genre to the song (song belongs to genre)
   @genre = genre_object
   genre_object.add_song(self)
 end

 def self.find_by_name(song_name)
    # passes in a song object name and finds a song instance in @@all by the name property of the song
    all.find { |song| song.name == song_name }
 end

 def self.find_or_create_by_name(song_name)
   # returns (does not recreate) an existing song with the provided name if one exists in @@all
    # invokes .find_by_name instead of re-coding the same functionality
    # creates a song if an existing match is not found
    # invokes .create instead of re-coding the same functionality
   find_by_name(song_name) || create(song_name)
 end

 def self.new_from_filename(filename)
   # binding.pry
   filename_array = filename.split(" - ")
   song = self.new(filename_array[1])
   # ("Thundercat - For Love I Come - dance.mp3") initializes a song based on the passed-in filename
    # invokes the appropriate Findable methods so as to avoid duplicating objects
   song.artist = Artist.find_or_create_by_name(filename_array[0])
   song.genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3", ""))
   song
 end

 def self.create_from_filename(filename)
   song = self.new_from_filename(filename).save
   song
 end




=======
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
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371

end

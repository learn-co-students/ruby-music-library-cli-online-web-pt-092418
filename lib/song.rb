class Song
 attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = 0)
    @name = name
    @artist = artist
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
end
class Artist

  attr_accessor :name
  @@all = []

 def initialize(artist_name)
    @name = artist_name
    @@all
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
   artist = self.new(artist_name)
   artist.save
   artist
 end


end

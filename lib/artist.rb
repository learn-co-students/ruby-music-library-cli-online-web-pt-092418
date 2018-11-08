class Artist
  attr_accessor :name, :song
  @@all = []
  @@songs = []
  def initialize(name)
    @name = name
    @@all << self
   # @songs = []
  end

  def self.all
    @@all
  end

  def save 
    self.class.all  << self
  end

  # def songs
  #   @songs
  # end
end
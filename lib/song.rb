class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name, artist=nil)
        @name = name
        @artist = artist #this states that a song obj belongs to an artist
    end

    def self.all
        @@all
    end

    def self.destroy_all
        # @@all.clear
        # @@all = []
        self.all.clear
    end

    def save
        # @@all << self
        self.class.all << self
    end

    def self.create(name)
        # initialize, saves & returns the song
        song = self.new(name)
        song.save
        song
    end

end
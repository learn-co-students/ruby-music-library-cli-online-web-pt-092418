class Genre 
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name 
    end   

    def self.all
        @@all
    end   

    def self.destroy_all
        # @@all.clear
        self.all.clear
    end

    def save
        # @@all << self
        self.class.all << self
    end

    def self.create(artist)
        artist_object = self.new(artist)
        artist_object.save
        artist_object
    end  
end   
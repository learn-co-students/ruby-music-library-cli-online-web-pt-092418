require 'pry'
class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(artist)
        @name = artist
        @songs = [] # states that an artist obj has many songs
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

    def add_song(song_obj)
         #tells or assigns the artists obj about the song
        #  binding.pry
         @songs << song_obj unless @songs.include?(song_obj)

        # song_obj.artist == self || song_obj.artist = self
        song_obj.artist ||= self
    end
ends
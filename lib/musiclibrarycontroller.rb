class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
    # accepts one argument, the path to the MP3 files to be imported
    # creates a new MusicImporter object, passing in the 'path' value
    # the 'path' argument defaults to './db/mp3s'
    # invokes the #import method on the created MusicImporter object
    end

    def call
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.chomp
        if input == "lists songs"
          list_songs
        elseif input == "list artists"
          list_artists
        elseif input == "list genres"
          list_genres
        elseif input == "list artist"
          list_songs_by_artist
        elseif input == "list genre"
          list_songs_by_genre
        elseif input == "play song"
          play_song
        else input == "exit"
          exit
        end
    end

    def list_songs
    end

    def list_artists
    end

    def list_genres
    end

    def list_songs_by_artist
    end

    def list_songs_by_genre
    end

    def play_song
    end

end

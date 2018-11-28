class MusicLibraryController
  attr_accessor :path
  attr_reader :new_import
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  def call
    input = ""
    message = ["Welcome to your music library!", "To list all of your songs, enter 'list songs'.", "To list all of the artists in your library, enter 'list artists'.", "To list all of the genres in your library, enter 'list genres'.", "To list all of the songs by a particular artist, enter 'list artist'.", "To list all of the songs of a particular genre, enter 'list genre'.", "To play a song, enter 'play song'.", "To quit, type 'exit'.", "What would you like to do?"]
    message.each{|phrase| puts phrase}
    while input != "exit"
      input = gets
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      else
        nil
      end
    end
  end
  def list_songs
    song = Song.all.sort_by!{|song| song.name}
    song.each.with_index(1){|song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_artists
    artist = Artist.all.sort_by!{|artist| artist.name}
    artist.each.with_index(1){|artist, i| puts "#{i}. #{artist.name}"}
  end
  def list_genres
    genre = Genre.all.sort_by!{|genre| genre.name}
    genre.each.with_index(1){|genre, i| puts "#{i}. #{genre.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    artist = Artist.find_by_name(input)
    if artist == nil
          "Please enter the name of an artist:"
    else
      sort = artist.songs.sort_by!{|song| song.name}
      sort.each.with_index(1){|song,i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    genre = Genre.find_by_name(input)
    if genre == nil
          "Please enter the name of a genre:"
    else
      sort = genre.songs.sort_by!{|genre| genre.name}
      sort.each.with_index(1){|song,i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = Integer(gets) rescue nil
    if input != nil && 0 < input && input < Song.all.length
      song = Song.all.sort_by!{|song| song.name}
      puts "Playing #{song[input.to_i - 1].name} by #{song[input.to_i - 1].artist.name}"
    end
  end
end

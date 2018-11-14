class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    new_import = MusicImporter.new(path)
    new_import.import
  end
  def call
    input = gets
    message = ["Welcome to your music library!", "To list all of your songs, enter 'list songs'.", "To list all of the artists in your library, enter 'list artists'.", "To list all of the genres in your library, enter 'list genres'.", "To list all of the songs by a particular artist, enter 'list artist'.", "To list all of the songs of a particular genre, enter 'list genre'.", "To play a song, enter 'play song'.", "To quit, type 'exit'.", "What would you like to do?"]
    message.each{|phrase| puts phrase}
    while input != "exit"
      puts "What would you like to do?"
      input = gets
    end
  end
end

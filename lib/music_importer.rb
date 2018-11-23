class MusicImporter

<<<<<<< HEAD
  # #initialize
  #   accepts a file path to parse MP3 files from
  # #path
  #   retrieves the path provided to the MusicImporter object
  # #files
  #   loads all the MP3 files in the path directory
  #   normalizes the filename to just the MP3 filename with no path

  attr_reader :path

=======
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
  def initialize(path)
    @path = path
  end

<<<<<<< HEAD
  def files
    # premoves syntax and provides files in path
    Dir.open(path).reject { |file| file[/^\.+/] }
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
=======
  def path
    @path
  end

  def files()
    @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end

  def import()
    files.each do |filename|
      Song.create_from_filename(filename)
    end
>>>>>>> 5b04373ddb8df0089bc452718367cebb749fa371
  end

end

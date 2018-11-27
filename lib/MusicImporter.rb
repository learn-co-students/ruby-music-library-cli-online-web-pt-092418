class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir.glob("#{@path}/*.mp3").map {|file| file.gsub("#{@path}/", "")}
   end

  def import
    @files.each {|filename|
      Song.create_from_filename(filename)
    }
  end

end 
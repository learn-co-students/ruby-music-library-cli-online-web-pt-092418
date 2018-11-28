require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    file = Dir.glob(File.join(self.path,"*.mp3"))
    file.map{|files| files.split(/\//)[-1]}
    #binding.pry
  end
  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end

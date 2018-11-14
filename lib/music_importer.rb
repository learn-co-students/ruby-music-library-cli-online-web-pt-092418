class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    file = Dir.glob(File.join(self.path,"*.mp3"))
    file.map{|files| files.split(/\bmp3s+\//).delete_at(1)}
  end
  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end

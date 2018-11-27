module Concerns::Findable

  def find_by_name(song_name)
    self.all.find {|name_ex| name_ex.name == song_name}
  end
 
  def create(name)
    create_obj = self.new(name)
    create_obj.save
    create_obj
  end
 
  def find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end
end
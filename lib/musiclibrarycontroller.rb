class MusicLibraryController 
  
  def initialize(path = './db/mp3s/')
    @new = MusicImporter.new(path)
    @new.import 
  end 
end 
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil 
      self.artist=artist
    end 

    if genre != nil 
      self.genre=genre
    end 
    
    save 
  end 

  def self.all
    @@all
  end 

  def self.destroy_all
    @@all.clear
  end 

  def save
    @@all << self
  end 

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end 

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end 

  def genre=(genre)

    @genre=genre 
    @genre.songs << self if !@genre.songs.include?(self)
  end 
  
  def find_by_name(name)
    self.all.detect{|song| song.name == name}
  end 

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create(name)
    end 
  end 
end 
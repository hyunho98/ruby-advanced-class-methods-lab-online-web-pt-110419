class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.class.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.class.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|i| i.name}
  end

  def self.new_from_filename(file)
    song = self.new
    names = file.split(" - ")
    names[1] = names[1].split(".").flatten[0]
    song.artist_name = names[0]
    song.name = names[1]
    song
  end

  def self.create_from_filename(file)
    song = self.new
    names = file.split(" - ")
    names[1] = names[1].split(".").flatten[0]
    song.artist_name = names[0]
    song.name = names[1]
    song.class.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

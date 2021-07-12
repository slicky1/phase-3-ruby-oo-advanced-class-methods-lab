class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  # inspired by the official solution
  def self.create
    song = Song.new
    song.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    self.all.find{|et| et.name == name}
  end

  def self.alphabetical
    self.all.sort_by!{|et| et.name}
  end

  def self.create_from_filename(name)
   song = self.new_from_filename(name)
   song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_or_create_by_name_0(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  # official solution
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.new_from_filename_0(filename)
    artist, suffix = filename.split(" - ")
    name = suffix[0..-5]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  # official solution
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

end
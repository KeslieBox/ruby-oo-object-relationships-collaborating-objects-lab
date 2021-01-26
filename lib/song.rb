require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name 
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.new_by_filename(filename)
        file_name = filename.split(" - ")
        song = Song.new(file_name[1])
        song.artist_name=(file_name[0])       
        song
    end
    
    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end

end
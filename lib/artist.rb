class Artist
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :song, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
        self
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def genres
        songs.collect{|song| song.genre}.uniq
    end

end

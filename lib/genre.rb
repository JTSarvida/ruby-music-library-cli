class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :song, :artist

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
        genre = Genre.new(name)
        genre.save
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end

    def add_song(song)
        song.genre = self unless song.genre
    end
    
    def artists
        songs.collect {|song| song.artist}.uniq
    end

end
class Characters

    attr_accessor :char_id, :name, :birthday, :occupation, :status

    @@all = []

    def initialize(char_id, name, birthday, occupation, status)
        @char_id = char_id
        @name = name
        @birthday = birthday
        @occupation = occupation
        @status = status
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
    end
end
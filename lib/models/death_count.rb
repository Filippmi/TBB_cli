class Deaths
    attr_accessor :death, :cause, :responsible, :character

    @@all = []

    def initialize(death, casue, responsible)
        @death = death
        @cause = casue
        @responsible = responsible
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
    end
end
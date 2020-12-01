class Characters

    attr_accessor :name, :birthday, :occupation, :status

    @@all = []

    def initialize(name, birthday, occupation, status)
        @name = name
        @birthday = birthday
        @occupation = occupation
        @status = status
        @deaths = []
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
    end

    def deaths
        Deaths.all.select {|death| death.responsible == self.name}
        binding.pry
    end
end
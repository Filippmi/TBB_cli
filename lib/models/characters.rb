class Characters

    attr_accessor :char_id, :name, :birthday, :occupation, :status

    @@all = []

    def initialize(data)
        self.char_id = data["char_id"]
        self.name = data["name"]
        self.birthday = data["birthday"]
        self.occupation = data["occupation"]
        self.status = data["status"]
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
        # binding.pry
    end
    # binding.pry

    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end
end
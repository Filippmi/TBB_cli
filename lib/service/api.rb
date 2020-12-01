class Api
    
    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.load_data
        puts "loading..."
        sleep(2.5)
        get_characters
        puts "Done."
    end

    def self.get_characters
        response = RestClient.get(base_url + '/characters')
        data = JSON.parse(response.body)
        data.each do |character_data|
            Characters.new(character_data)
        end
        # binding.pry
    end
end
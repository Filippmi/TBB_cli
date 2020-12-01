class Api
    
    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.load_data
        get_characters
    end

    def self.get_characters
        response = RestClient.get(base_url + '/characters')
        data = JSON.parse(response.body)
        data.each do |c|
            Characters.new(c["char_id"], c["name"], c["birthday"], c["occupation"], c["status"])
        end
        # binding.pry
    end
end
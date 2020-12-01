class Api
    
    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.get_characters
        response = RestClient.get(base_url + '/characters')
        data = JSON.parse(response.body)
        data.each do |c|
            Characters.new(c["name"], c["birthday"], c["occupation"], c["status"])
        end
        # binding.pry
    end

    def self.deaths
        response = RestClient.get(base_url + '/deaths')
        data = JSON.parse(response.body)
        data.each do |d|
            Deaths.new(d["death"], d["cause"], d["responsible"])
            # binding.pry
        end
    end
end
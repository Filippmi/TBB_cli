class Api
    
    def self.base_url
        "https://www.breakingbadapi.com/api"
    end

    def self.load_data
        print "\n" "Loading" 
        "..........".each_char {|c| putc c ; sleep 0.3; $stdout.flush }
        sleep(0.3)
        get_characters
        print "\n" "Done".each_char {|c| sleep 0.05; $stdout.flush }
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
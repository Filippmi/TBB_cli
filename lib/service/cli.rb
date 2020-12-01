class Cli

    def start
        puts "Welcome to my Breaking Bad cli"
        load_data
        puts main_menu
    end

    def main_menu
        puts "For the list of characters, press 1"
        puts "For a list of all the deaths, press 2"
        puts "To exit, type 'exit'"

        main_menu_input
    end

    def load_data
        puts "Loading..."
        Api.get_characters
        Api.deaths
        # binding.pry
    end

    def main_menu_input
        input = gets.chomp
    end
end
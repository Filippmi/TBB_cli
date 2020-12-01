class Cli

    def start
        puts "Welcome to my Breaking Bad cli"
        Api.load_data
        puts main_menu
    end

    def main_menu
        puts "Type 'characters' to get a list of all characters"
        puts 

        main_menu_input
    end

    def main_menu_input
        input = gets.chomp

        if input == [1]
            
        end
    end
end
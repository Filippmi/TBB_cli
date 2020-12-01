class Cli

    def start
        system("clear")
        puts "Welcome to my Breaking Bad cli"
        sleep(1.5)
        Api.load_data

        main_menu
        # binding.pry
    end

    def main_menu
        sleep(1)
        puts "Type 'characters' to get a list of all characters"
        sleep(0.2)
        puts "Or 'exit' to exit the program"

        main_menu_input
    end

    def main_menu_input
        input = gets.chomp

        if input.downcase == "characters"
            system("clear")
            character_list
            sub_menu 
        elsif
            input.downcase == "exit"
            puts "Thank you for checking out my program."
            puts "Have a great day!"
            exit
        else
            raise_error
            main_menu
        end
    end

    def sub_menu
        sub_menu_selection
        id = valid_id?(gets.chomp)
        character = Characters.find_by_id(id)
        character_details(character)
        raise_continue
    end

    def character_list
        Characters.all.each.with_index(1) do |character, index|
            puts "#{index}.) #{character.name}"
        end
    end

    def sub_menu_selection
        puts "Type in a character by number for more info."
    end

    def valid_id?(id)
        id = id.to_i
    end

    def character_details(character)
        puts "Name:   #{character.name}"
        puts "Birthday:  #{character.birthday}"
        puts "Occupation:  #{character.occupation}"
        puts "Status:  #{character.status}"
    end

    def raise_continue
        puts "Would you like information about another character?     y/n"
    end

    def raise_error
        puts "please make a valid entry"
    end

    def selection 
        gets.chomp
    end

    def continue?(selection)
        if selection.downcase == "y"
            main_menu
            main_menu_input
        else
            exit
        end
    end
end
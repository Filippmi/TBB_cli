class Cli

    def start
        system("clear")
        welcome
        Api.load_data
        main_menu
    end

    def main_menu
        "\n" "Type 'characters' to get a list of all characters".each_char {|c| putc c ; sleep 0.02; $stdout.flush }
        "\n" "Or 'exit' to exit the program".each_char {|c| putc c ; sleep 0.02; $stdout.flush }
        print "\n" ": "
        main_menu_input
    end

    def main_menu_input
        input = gets.chomp
        

        if input.downcase == "characters"
            system("clear")
            character_list
            # sleep(1)
            sub_menu 
        elsif
            input.downcase == "exit"
            exit_program
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
            puts "#{index}.) #{character.name}".each_char {|c| sleep 0.002; $stdout.flush}
        end
    end

    def sub_menu_selection
        "\n" "Type in the index number to see more information about that character.".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
        "\n" "selection: ".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
    end

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Characters.all.size
            raise_error
            sub_menu_input
        end
        id
    end

    def character_details(character)
       "Name:   #{character.name}".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
       "\n" "Birthday:  #{character.birthday}".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
       "\n" "Occupation:  #{character.occupation}".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
       "\n" "Status:  #{character.status}".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
    end

    def raise_continue
        puts "\n" "Would you like information about another character?     y/n"
        continue(selection)
    end

    def raise_error
        "\n" "please make a valid entry".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
        "\n" "selection: ".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
    end

    def selection 
        gets.chomp
    end

    def continue(choice)
        if choice.downcase == "yes" || choice.downcase == "y"
            # character_list
            sub_menu
        elsif choice.downcase == "no" || choice.downcase == "n"
            exit_program
        else
            raise_error
            continue(selection)
        end
    end

    def exit_program
        "\n" "Thank you for checking out my program.".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
        "\n" "Have a great day!".each_char {|c| putc c ; sleep 0.01; $stdout.flush }
        sleep(2.5)
        exit
    end

    def welcome
        "Welcome to my Breaking Bad cli ".each_char {|c| putc c ; sleep 0.02; $stdout.flush  }
    end

    def sub_menu_input
        id = valid_id?(gets.chomp)
        character = Characters.find_by_id(id)
        character_details(character)
        raise_continue  
    end
end
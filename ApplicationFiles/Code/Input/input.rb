class Input

    def promptPlayerToGetRollFileNumber(isFirstTime)
        puts "\n\n\n" #empty lines between games
        welcomeBack = isFirstTime ? "" : "back "
        puts "Welcome #{welcomeBack}to Ambers Monopoly Console Game. \nBefore we play, I need you to pick which die roll file you wish you use."
        puts "Please press 1 or 2 and then press enter."
        selected_file = nil
        fileNumber = 0
        loop do
            puts "Please select a die roll file (type '1' or '2' or 'quit'):"
            input = gets.chomp.downcase

            if input == "1"
                fileNumber = 1
                break
            elsif input == "2"
                fileNumber = 2
                break
            elsif input =="quit"           
                fileNumber = nil
                break
            puts "Invalid choice. Please type '1' or '2', or 'quit' (without quotation marks)."
            end
        end
        return fileNumber
    end
end
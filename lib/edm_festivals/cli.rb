class EdmFestivals::CLI 
    def call 
        create_festivals
        add_attributes_to_festivals
        start
    end

    def create_festivals 
        festivals_array = EdmFestivals::Scraper.scrape_main_page("https://www.electronic-festivals.com/festivals/top100-ranking")
        EdmFestivals::Festival.create_from_collection(festivals_array)
    end

    def add_attributes_to_festivals
        EdmFestivals::Festival.all.each do |festival|
            info = EdmFestivals::Scraper.festival_info_page("https://www.electronic-festivals.com/" + festival.festival_url)
            festival.add_attributes(info)
        end
    end

    def list(from_num)
        puts "Here is the top #{from_num + 1} to #{from_num +10}:"
        EdmFestivals::Festival.all[from_num, 10].each.with_index(from_num) do |festival, index|
            puts "#{index + 1}. #{festival.name} - #{festival.country}"
        end
        from_num += 10
    end

    def print_info(input)
        input = input.to_i
        puts "Name: #{EdmFestivals::Festival.all[input - 1].name}"
        puts ""
        puts "Description: #{EdmFestivals::Festival.all[input - 1].description}"
        puts ""    
        puts "Total Visitors:  #{EdmFestivals::Festival.all[input - 1].visitors}"
        puts "" 
        puts "Venue Type:      #{EdmFestivals::Festival.all[input - 1].venue_type}"
        puts "" 
        puts "Festival Length: #{EdmFestivals::Festival.all[input - 1].length}" 
        puts "" 
        puts "Website:         #{EdmFestivals::Festival.all[input - 1].website}"
        puts "..........................................."
    end

    def start 
       puts "Welcome to the top 100 EDM festivals around the world!"
       puts "        ..................***................" 
       from_num = 0 
       from_num = list(from_num) 
       puts ""
       puts "Would you like to know more information of any event?"
       input = ""
       until input == "exit"
            if from_num < 100 
                puts ""
                puts "Enter the index number of the festival you are interested in."
                puts "Enter 'next' if you want to see more festivals or 'exit' if you want to exit."
                input = gets.strip
                if input.to_i.between?(from_num - 9, from_num)
                    print_info(input)
                elsif input == "next"
                    from_num = list(from_num)
                end
            else  
                puts ""
                puts "Enter the index number of the festival you are interested in or 'exit' if you want to exit."
                input =gets.strip
                print_info(input)  if input.to_i.between?(from_num - 9, from_num)
            end    

        end
        puts "Hopefully, you got some helpful information about EDM festivals around the world."
        
           
        input = ""
        
        until input == "n" || input == "no"
            puts "Would you like to start over? (y/n)"
            input = gets.strip.downcase
                if input == "y" || input == "yes"
                    start 
                    input = "n"
                elsif input == "n" || input == "no"
                    puts "Thank you for using this app, bye bye!"
                else
                    puts "Invalid input!!!, Please enter your answer again."
                end
        
        end
        
    end

    

end


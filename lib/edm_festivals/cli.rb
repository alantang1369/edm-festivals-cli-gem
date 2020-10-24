class EdmFestivals::CLI 
    def call 
        puts "Welcome to the electric sky!"
        puts "Here is the top 100 festivals around the world that you never wanna miss:"
        EdmFestivals::Scraper.scrape_main_page("https://www.electronic-festivals.com/festivals/top100-ranking")
    end
end


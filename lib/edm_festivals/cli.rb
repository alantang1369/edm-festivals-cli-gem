class EdmFestivals::CLI 
    def call 
        puts "Welcome to the electric sky!"
        puts "Here is the top 100 festivals around the world that you never wanna miss:"
        a = EdmFestivals::Scraper.scrape_main_page("https://www.electronic-festivals.com/festivals/top100-ranking")
        festival_url = a.first[:festival_url]
        puts EdmFestivals::Scraper.scrape_festival_page("https://www.electronic-festivals.com/" + festival_url)
    end
end


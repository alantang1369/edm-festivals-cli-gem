class EdmFestivals::Scraper 
    def self.scrape_main_page(index_url)
        index_page = Nokogiri::HTML(open(index_url))
        festivals = []
        index_page.css(".festival-list.column.col-xs-12.col-sm-12.col-md-12.col-lg-12").each do |fes|
            fes_name = fes.search(".views-field-name a").text.strip
            fes_country = fes.search(".views-field-country").text.strip
            fes_url = "#{fes.search(".views-field-name a").attr('href')}"
            festivals << {name:  fes_name, country: fes_country, festival_url: fes_url}
        end
        festivals
    end     

end    
class EdmFestivals::Scraper 
    def self.scrape_main_page(index_url)
        index_page = Nokogiri::HTML(open(index_url))
        index_page.css(".festival-list.column.col-xs-12.col-sm-12.col-md-12.col-lg-12").map do |fes|
            fes_name = fes.search(".views-field-name a").text.strip
            fes_country = fes.search(".views-field-country").text.strip
            fes_url = "#{fes.search(".views-field-name a").attr('href')}"
            {name:  fes_name, country: fes_country, festival_url: fes_url}
        end
        
    end     

    def self.festival_info_page(festival_url)
        festival = {}
        festival_page = Nokogiri::HTML(open(festival_url))
        
        festival[:description] = festival_page.css(".col-xs-12.nopadding.description").text
        festival[:visitors ] = festival_page.css(".col-xs-auto.col-sm-auto.nopadding.disc").text.gsub(/\D/,"").strip
        festival[:venue_type] = festival_page.css(".col-xs-auto.col-sm-auto.nopadding.disc").text.gsub(/(\d|Multi Day Festival|Single Day Event)/,"").strip
        festival[:length] = festival_page.css(".col-xs-auto.col-sm-auto.nopadding.nomarginright.disc").text
        festival[:website] = festival_page.css(".col-xs-12.nopadding.eventlinks.link a").text
        
        festival
    end

end    
class EdmFestivals::Festival
    attr_accessor :name, :country, :festival_url, :description, :visitors, :venue_type, :length, :website
    @@all = []
    def initialize(event)
        event.each do |attribute, value|
            self.send("#{attribute}=", value)
        end
        @@all << self 
    end

    def self.create_from_collection(festivals_array)
        festivals_array.each {|event| new(event)}
    end

    def add_attributes(info)
        info.each do |attribute, value| 
            self.send("#{attribute}=", value)
        end
        self
    end

    def self.all 
        @@all 
    end
end

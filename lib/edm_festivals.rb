require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative "./edm_festivals/version"
require_relative "./edm_festivals/cli"
require_relative "./edm_festivals/scraper"
require_relative "./edm_festivals/festivals"



module EdmFestivals
  class Error < StandardError; end
  # Your code goes here...
end

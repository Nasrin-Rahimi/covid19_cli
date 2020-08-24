require 'open-uri'
require 'net/http'
require 'json'
require 'pry'

class Covid19::API

  URL = "https://corona-api.com/countries"
  
  def self.get_request
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  # we use the JSON library to parse the API response into nicely formatted JSON
  def self.get_countries
    
    countries = JSON.parse(self.get_request)
    Covid19::Country.new_from_collection(countries["data"])
   
    # way 1
   
    # countries["data"].collect do |country|
        
    #     # Covid19::Country.new(country)
    # end

    # way 2
    # Covid19::Country.new_from_collection(countries)
  end
  
end

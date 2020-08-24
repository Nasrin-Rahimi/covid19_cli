require 'open-uri'
require 'net/http'
require 'json'

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
  end
  
end

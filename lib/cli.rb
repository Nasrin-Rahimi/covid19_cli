 class Covid19::CLI

    def call
      Covid19::API.get_countries
      menu
    end
      
    def all_countries
      write_header
      Covid19::Country.all.each.with_index(1){|c,index| 
      puts "#{index}.  #{c.name} | #{c.population} |  #{c.latest_confirmed} | #{c.latest_deaths} | #{c.recovered}" 
      puts "------------------------------------------------------"}
    end

    def  all_cases_in_the_world
      confirmed = 0
       deaths = 0
      recovered = 0
      Covid19::Country.all.each do |country|
        confirmed += country.latest_confirmed
        deaths += country.latest_deaths
        recovered += country.recovered
      end
      puts "\nConfirmed countries in total: #{Covid19::Country.all.count}"
      puts "Confirmed: #{confirmed}".blue
      puts "Recovered: #{recovered}".green
      puts "Deaths: #{deaths}".red
     end

    def list_most_cases
      write_header
      countries = Covid19::Country.all.max_by(5){|c| c.latest_confirmed}
      countries.each do |country|
        puts "#{country.name}   | #{country.population} |   #{country.latest_confirmed}  |   #{country.latest_deaths}  |   #{country.recovered}"
        puts "------------------------------------------------------"
      end
    end

    def get_country_by_name
      input = gets.strip.downcase
      country = Covid19::Country.find_by_name(input)
      if country == nil
         puts "The country name is invalid! Please enter a country name again."
        get_country_by_name
      else
        output_country(country) 
      end
    end

    def output_country(country)
      puts "\nCovid-19 info for #{country.name} - updated at #{country.updated_at}"
      puts "Population: #{country.population}"
      puts "Total Cases: #{country.latest_confirmed}".blue
      puts "Total Deaths: #{country.latest_deaths}".red
      puts "New Cases: #{country.today_confirmed}".blue
      puts "New Deaths: #{country.today_deaths}".red
      puts "Recovered: #{country.recovered}".green
      puts "Death Rate: #{country.death_rate.round(2)}%".red
      puts "Recovery Rate: #{country.recovery_rate.round(2)}%".green
    end
      
  def menu
    puts "\nWelcome to Covid19 CLI!"
    input = nil
        
    while input != "exit" do
      puts "\nTo see Covid-19 info about all countries, enter 'countries'."
      puts "To see first 5 countries with the most Covid-19 cases, enter 'most'."
      puts "To see all Covid-19 cases in the whole world, enter 'all'."
      puts "To see a country Covid-19 information, enter 1."
      puts "To quit, type 'exit'."
      puts "\nWhat would you like to do?"
      input = gets.strip.downcase
      case input
      when "countries"
        all_countries
      when "all"
        all_cases_in_the_world
      when "most"
        list_most_cases
      when "1"
        puts "Please enter country name"  
        get_country_by_name
      when "exit"
         goodbye
      else 
         puts "Not sure what you want!"
      end
    end
  end
    
  def goodbye
    puts "\nEnjoy!\n".green
  end

  def write_header
    puts "Country | Population |  Total Cases | Total Deaths | Recovered"
    puts "--------------------------------------------------------------"
  end

end
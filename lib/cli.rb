 class Covid19::CLI

    def call
        menu
        goodbye
      end
      
      def all_countries
        write_header
        Covid19::Country.all.each.with_index(1){|c,index| 
        puts "#{index}.  #{c.name} | #{c.latest_confirmed} | #{c.latest_deaths} | #{c.recovered}" 
        puts "-------------------------------------------------"}
      end

      def  all_cases_in_the_world
         confirmed = 0
         deaths = 0
         recovered = 0
        Covid19::Country.all.each { |c| confirmed += c.latest_confirmed && deaths += c.latest_deaths && recovered += c.recovered}
        puts "\nConfirmed countries in total: #{Covid19::Country.all.count}"
        puts "Confirmed: #{confirmed}".blue
        puts "Recovered: #{recovered}".green
        puts "Deaths: #{deaths}".red
      end

      def list_most_cases
        write_header
        countries = Covid19::Country.all.max_by(5){|c| c.latest_confirmed}
        countries.each do |country|
          puts "#{country.name}   |   #{country.latest_confirmed}  |   #{country.latest_deaths}  |   #{country.recovered}"
          puts "-------------------------------------------------"
        end
      end

      def get_country_by_name(name)
        country = Covid19::Country.all.find{|c| c.name.downcase == name} 
        puts "\nCovid-19 info for #{country.name} - updated at #{country.updated_at}"
        puts "Population: #{country.population}"
        puts "Total Cases: #{country.latest_confirmed}".blue
        puts "Total Deaths: #{country.latest_deaths}".red
        puts "New Cases: #{country.today_confirmed}".blue
        puts "New Deaths: #{country.today_deaths}".red
        puts "Recovered: #{country.recovered}".green
        puts "Death Rate: #{country.death_rate.round(2)}%"
        puts "Recovery Rate: #{country.recovery_rate.round(2)}%"
      end
      
      def menu
        puts "\nWelcome to Covid19 CLI!"
        input = nil
        
        while input != "exit" do
            puts "\nTo list all of countries, enter 'countries'."
            puts "To list first 5 countries with the most Covid-19 cases, enter 'most'."
            puts "To see all cases in the whole world, enter 'all'."
            puts "To see a country covid-19 information, enter 1."
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
              input = gets.strip.downcase
              get_country_by_name(input)
            else 
              puts "Not sure what you want, type list or exit"
             end
        end
      end
    
      def goodbye
        puts "\nEnjoy!\n".green
      end

      def write_header
        puts "country |  Total Cases | Total Deaths | Recovered"
        puts "-------------------------------------------------"
      end


end
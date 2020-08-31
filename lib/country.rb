class Covid19::Country

    attr_accessor :name, :population, :updated_at, :today_deaths, :today_confirmed, :latest_deaths, :latest_confirmed, :recovered, :death_rate, :recovery_rate, :recovered_vs_death_ratio, :cases_per_million_population 

    @@all = []

    def initialize(data)
        @name = data["name"]
        @population = data["population"]
        @updated_at = data["updated_at"]
        @today_deaths = data["today"]["deaths"]
        @today_confirmed = data["today"]["confirmed"]
        @latest_deaths = data["latest_data"]["deaths"]
        @latest_confirmed = data["latest_data"]["confirmed"]
        @recovered = data["latest_data"]["recovered"]
        @death_rate = data["latest_data"]["calculated"]["death_rate"]
        @recovery_rate = data["latest_data"]["calculated"]["recovery_rate"]
        @recovered_vs_death_ratio = data["latest_data"]["calculated"]["recovered_vs_death_ratio"]
        @cases_per_million_population = data["latest_data"]["calculated"]["cases_per_million_population"]
        save

    end

    def self.new_from_collection(countries)
        countries.each do |data|
            new(data)
        end 
    end

    def self.get_countries
        Covid19::API.get_countries
        all
    end
    

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.detect{|c| c.name.downcase == name}
    end

    # def initialize(attrs)
    #     attrs_from_hash(attrs)
    #     save
    #   end
    
   
    # def attrs_from_hash(attrs)
    #     attrs.each do |k, v|
    #         send("#{k}=", v)
    #     end
    #   end

    def save 
        @@all << self
    end

end
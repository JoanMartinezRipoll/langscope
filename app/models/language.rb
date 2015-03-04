class Language < ActiveRecord::Base
  has_many :percent_languages
  has_many :percentages, :through => :percent_languages

  def self.get_scope_of(languages)
    country_scopes = Hash.new
    percentages = Set.new

    #The set is used to remove percentages that are common for same languages.
    #Imagine that there is a 30% with spanish and english and a 10% with english
    #If we want to now the scope of spanish and english, we only want to take into account
    #the 30% once!
    languages.each do |language|
      language.percentages.each do |percentage|
        percentages.add(percentage)
      end
    end

    percentages.each do |percentage|
      country = percentage.country
      percent_scope =  country_scopes.has_key?(country.id) ?  country_scopes[country.id][0] + percentage.percent : percentage.percent
      population_scope =  country.population * (percent_scope/100)
      country_scopes[country.id] = percent_scope , population_scope
    end
    return country_scopes , world_ratio(country_scopes)
  end

  private

  def self.world_ratio (country_scopes)
    total_population_scope = 0
    country_scopes.values.each do |percent, population|
      total_population_scope += population
    end
    (total_population_scope/ Country.sum(:population)) * 100
  end
end

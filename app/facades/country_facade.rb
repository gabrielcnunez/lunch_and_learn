class CountryFacade
  def self.get_country(country)
    if country.nil?
      country_names = CountryService.all_countries.map {|country| country[:name][:common]}
      country_names.sample
    else
      country
    end
  end
end
class CountriesService
  def self.get_all_countries
    response = conn.get("/v3.1/all") 
    JSON.parse(response.body,symbolize_names: true)
  end
  
  def self.conn 
    Faraday.new("https://restcountries.com")
  end 
end
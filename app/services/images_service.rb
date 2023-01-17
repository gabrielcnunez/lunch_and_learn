class ImagesService
  def self.get_images(country)
    response = conn.get("/search/photos?query=#{country}")
    JSON.parse(response.body,symbolize_names: true)
  end 

  def self.conn 
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['images_api_key']
    end 
  end 
end
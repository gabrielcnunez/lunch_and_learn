class ImagesFacade
  def self.get_images(country)
    images = ImagesService.get_images(country)
    if images[:results].empty?
      nil
    else
      images[:results].first(10).map do |image|
        Image.new(image)
      end
    end
  end
end
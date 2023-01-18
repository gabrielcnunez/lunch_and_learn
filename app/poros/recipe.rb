class Recipe
  attr_reader :title,
              :url,
              :image

  def initialize(data, country)
    @title   = data[:recipe][:label]
    @url     = data[:recipe][:url]
    @image   = data[:recipe][:image]
  end
end
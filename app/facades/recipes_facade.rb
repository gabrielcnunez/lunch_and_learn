class RecipesFacade
  def self.get_recipes(country)
    recipes = RecipesService.get_recipes(country)
    recipes[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end
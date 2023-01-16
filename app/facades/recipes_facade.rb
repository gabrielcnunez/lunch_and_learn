class RecipesFacade
  def self.get_recipes(country)
    recipes = RecipesService.get_recipes(country)
    recipes[:hits].map do |recipe|
      Recipe.new(recipe)
    end
  end
end
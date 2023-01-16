class Api::V1::RecipesController < ApplicationController
  def search
    country = CountryFacade.get_country(params[:country])
    recipes = RecipesFacade.get_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end
end
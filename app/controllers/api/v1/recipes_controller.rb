class Api::V1::RecipesController < ApplicationController
  def search
    country = params[:country]
    recipes = RecipesFacade.get_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end
end
require 'rails_helper'

describe 'The Recipes API' do
  it 'can find recipes based on country' do
    country = 'thailand'

    get "api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    recipes = JSON.parse(response.body,symbolize_names: true)

    expect(recipes).to be_a(Hash)
    expect(recipes).to have_key(:data)
    expect(recipes[:data]).to be_an(Array)

    recipes.each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq(null)

      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq("recipe")

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to eq(country)
      expect(recipe[:attributes]).to have_key(:image)
    end
  end
end
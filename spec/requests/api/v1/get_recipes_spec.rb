require 'rails_helper'

describe 'The Recipes API' do
  it 'can find recipes based on chosen country' do
    VCR.use_cassette('get_recipes_by_thailand') do
      country = 'thailand'

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      recipes = JSON.parse(response.body,symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)

      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq(nil)

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq("recipe")

        expect(recipe).to have_key(:attributes)
        expect(recipe[:data][0][:attributes]).to have_key(:title)
        expect(recipe[:data][0][:attributes]).to have_key(:url)
        expect(recipe[:data][0][:attributes]).to have_key(:country)
        expect(recipe[:data][0][:attributes][:country]).to eq(country)
        expect(recipe[:data][0][:attributes]).to have_key(:image)
        expect(recipe[:data][0][:attributes].keys.size).to eq(4)
      end
    end
  end

  it 'can find recipes based on a random country' do
    get "/api/v1/recipes"

    expect(response).to be_successful

    recipes = JSON.parse(response.body,symbolize_names: true)

    expect(recipes).to be_a(Hash)
    expect(recipes).to have_key(:data)
    expect(recipes[:data]).to be_an(Array)
    
    expect(recipes[:data][0]).to have_key(:id)
    expect(recipes[:data][0][:id]).to eq(nil)

    expect(recipes[:data][0]).to have_key(:type)
    expect(recipes[:data][0][:type]).to eq('recipe')

    expect(recipes[:data][0]).to have_key(:attributes)
    expect(recipes[:data][0][:attributes]).to have_key(:title)
    expect(recipes[:data][0][:attributes]).to have_key(:url)
    expect(recipes[:data][0][:attributes]).to have_key(:country)
    expect(recipes[:data][0][:attributes]).to have_key(:image)
    expect(recipes[:data][0][:attributes].keys.size).to eq(4)
  end
end
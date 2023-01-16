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
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to eq(country)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes].keys.size).to eq(4)
      end
    end
  end

  it 'can find recipes based on a random country' do
    VCR.use_cassette('all_countries') do
      json_response = File.read('spec/fixtures/sample_json/some_random_country.json')
      stub_request(:any, /edamam/).to_return(status: 200, body: json_response)
      get '/api/v1/recipes'
    end

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

  it 'returns an empty array when no recipes match the chosen country' do
    VCR.use_cassette('no_recipes_from_kyrgyzstan') do
      country = 'kyrgyzstan'

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      no_recipes = JSON.parse(response.body,symbolize_names: true)

      expect(no_recipes).to be_a(Hash)
      expect(no_recipes).to have_key(:data)
      expect(no_recipes[:data]).to be_an(Array)
      expect(no_recipes[:data]).to eq([])
    end
  end

  it 'returns an empty array when an empty string is given as a parameter' do
    VCR.use_cassette('no_recipes_with_empty_string') do
      get "/api/v1/recipes?country="

      expect(response).to be_successful

      no_recipes = JSON.parse(response.body,symbolize_names: true)

      expect(no_recipes).to be_a(Hash)
      expect(no_recipes).to have_key(:data)
      expect(no_recipes[:data]).to be_an(Array)
      expect(no_recipes[:data]).to eq([])
    end
  end
end
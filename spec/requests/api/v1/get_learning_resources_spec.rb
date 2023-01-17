require 'rails_helper'

describe 'The Learning Resources API' do
  let(:response_body_1) { File.open('./spec/fixtures/sample_json/laos_video_search.json')}
  let(:response_body_2) { File.open('./spec/fixtures/sample_json/laos_images_search.json')}
  let(:response_body_3) { File.open('./spec/fixtures/sample_json/no_videos_found.json')}
  let(:response_body_4) { File.open('./spec/fixtures/sample_json/no_images_found.json')}

  it 'can get learning resources based on the name of a country' do
    stub_request(:get, /googleapis/).to_return(status: 200, body: response_body_1)
    stub_request(:get, /unsplash/).to_return(status: 200, body: response_body_2)
    
    country = 'laos'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    
    resources = JSON.parse(response.body,symbolize_names: true)

    expect(resources).to be_a(Hash)
    expect(resources).to have_key(:data)
    expect(resources[:data]).to be_an(Hash)

    expect(resources[:data]).to have_key(:id)
    expect(resources[:data][:id]).to eq(nil)
    expect(resources[:data]).to have_key(:type)
    expect(resources[:data][:type]).to eq("learning_resource")
    expect(resources[:data]).to have_key(:attributes)
    expect(resources[:data][:attributes]).to be_a(Hash)

    expect(resources[:data][:attributes]).to have_key(:country)
    expect(resources[:data][:attributes][:country]).to eq(country)

    expect(resources[:data][:attributes]).to have_key(:video)
    expect(resources[:data][:attributes][:video]).to be_a(Hash)
    expect(resources[:data][:attributes][:video]).to have_key(:title)
    expect(resources[:data][:attributes][:video]).to have_key(:youtube_video_id)
    expect(resources[:data][:attributes][:video].keys.size).to eq(2)
    
    expect(resources[:data][:attributes]).to have_key(:images)
    expect(resources[:data][:attributes][:images]).to be_an(Array)
    expect(resources[:data][:attributes][:images].size).to eq(10)

    resources[:data][:attributes][:images].each do |image|
      expect(image).to have_key(:alt_tag)
      expect(image).to have_key(:url)
      expect(image.keys.size).to eq(2)
    end

    expect(resources[:data][:attributes].keys.size).to eq(3)
  end

  it 'returns an empty object if no videos or photos can be found' do
    stub_request(:get, /googleapis/).to_return(status: 200, body: response_body_3)
    stub_request(:get, /unsplash/).to_return(status: 200, body: response_body_4)
    
    country = 'cordovia'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    
    resources = JSON.parse(response.body,symbolize_names: true)

    expect(resources).to be_a(Hash)
    expect(resources).to have_key(:data)
    expect(resources[:data]).to be_an(Hash)

    expect(resources[:data]).to have_key(:id)
    expect(resources[:data][:id]).to eq(nil)
    expect(resources[:data]).to have_key(:type)
    expect(resources[:data][:type]).to eq("learning_resource")
    expect(resources[:data]).to have_key(:attributes)
    expect(resources[:data][:attributes]).to be_a(Hash)

    expect(resources[:data][:attributes]).to have_key(:country)
    expect(resources[:data][:attributes][:country]).to eq(country)
    expect(resources[:data][:attributes]).to have_key(:video)
    expect(resources[:data][:attributes][:video]).to eq({})
    expect(resources[:data][:attributes]).to have_key(:images)
    expect(resources[:data][:attributes][:images]).to eq([])
  end
end
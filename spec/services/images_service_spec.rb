require 'rails_helper'

RSpec.describe ImagesService do
  let(:response_body) { File.open('./spec/fixtures/sample_json/laos_images_search.json') }
  
  it '.all_countries' do
    stub_request(:get, /unsplash/).to_return(status: 200, body: response_body)
    images = ImagesService.get_images('laos')

    expect(images).to be_a Hash
    expect(images).to have_key :results
    
    images[:results].each do |image|
      expect(image).to have_key :alt_description
      expect(image).to have_key :urls
      expect(image[:urls]).to have_key :regular
    end
  end 
end 
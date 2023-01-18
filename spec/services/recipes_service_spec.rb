require 'rails_helper'

RSpec.describe RecipesService do
  it '.get_recipes' do
    VCR.use_cassette('get_recipes_by_thailand') do
      recipes = RecipesService.get_recipes('thailand')

      expect(recipes).to be_a Hash
      expect(recipes).to have_key :hits

      recipes[:hits].each do |recipe|
        expect(recipe).to have_key :recipe
        expect(recipe[:recipe]).to have_key :label
        expect(recipe[:recipe]).to have_key :url
        expect(recipe[:recipe]).to have_key :image
      end
    end
  end 
end 
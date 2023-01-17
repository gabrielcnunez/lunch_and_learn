require 'rails_helper'

describe 'The Users API' do
  describe 'POST favorites' do
    it 'adds a favorite for a valid user' do
      user = User.create!(
                          name: 'Athena Dao',
                          email: 'athenadao@bestgirlever.com',
                          api_key: SecureRandom.alphanumeric(12)
                          )

      fav_params = { 
                        api_key: user.api_key,
                        country: 'thailand',
                        recipe_link: 'https://www.seriouseats.com/kenji_rulez.html',
                        recipe_title: 'Garlic Noodles (A San Francisco Treat, not THE San Francisco Treat)'
                    }
      headers = {
                    'Content-Type' => 'application/json',
                    'Accept' => 'application/json'        
                }

      expect(Favorite.all.count).to eq(0)

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
  
      expect(Favorite.all.count).to eq(1)

      new_favorite = Favorite.last
      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful 
      expect(response.status).to eq(201)

      expect(response_data).to be_a(Hash)
      expect(response_data).to have_key(:sucess)
      expect(response_data[:success]).to eq("Favorite added successfully")
      
      expect(new_favorite.country).to eq(fav_params[:country])
      expect(new_favorite.recipe_link).to eq(fav_params[:recipe_link])
      expect(new_favorite.recipe_title).to eq(fav_params[:recipe_title)
      expect(new_favorite.user_id).to eq(user.id)
    end
  end
end
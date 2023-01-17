require 'rails_helper'

describe 'The Users API' do
  it "can create a user" do 
    user_params = { 
                    name: 'Athena Dao',
                    email: 'athenadao@bestgirlever.com'
                  }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'        
    }

    expect(User.all.count).to eq(0)

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(User.all.count).to eq(1)

    new_user = User.last
    user_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful 
    expect(response.status).to eq(201)

    expect(user_data).to be_a(Hash)
    expect(user_data).to have_key(:data)
    expect(user_data[:data]).to be_an(Hash)

    expect(user_data[:data]).to have_key(:id)
    expect(user_data[:data][:id]).to eq(new_user.id)
    expect(user_data[:data]).to have_key(:type)
    expect(user_data[:data][:type]).to eq("user")
    expect(user_data[:data]).to have_key(:attributes)
    expect(user_data[:data][:attributes]).to be_a(Hash)

    expect(user_data[:data][:attributes]).to have_key(:name)
    expect(user_data[:data][:attributes][:name]).to eq(new_user.name)
    expect(user_data[:data][:attributes]).to have_key(:email)
    expect(user_data[:data][:attributes][:email]).to eq(new_user.email)
    expect(user_data[:data][:attributes]).to have_key(:api_key)
  end
end
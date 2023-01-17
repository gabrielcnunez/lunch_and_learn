Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/recipes', to: 'api/v1/recipes#search'
  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#search'
  post '/api/v1/users', to: 'api/v1/users#create'
end

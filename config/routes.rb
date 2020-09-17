Rails.application.routes.draw do
  get  '/games', to: 'games#index'
  post '/games', to: 'games#create'
end

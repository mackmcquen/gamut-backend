Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  resources :artworks
  resources :collections
  resources :artwork_collections
end

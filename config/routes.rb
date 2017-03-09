Rails.application.routes.draw do
  resources :listings
  resources :users
  resources :responses
  resources :listingphotos

  root 'page#index'

  #search
  get 'page/search'
  post 'page/search'

  # questionnaire
  get '/questionnaire' => 'responses#new'
  post '/questionnaire' => 'responses#create'

  # registration
  get '/register' => 'users#new'

  # routes for login form, logging in, and logging out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # facebook
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/facebook', as: 'facebook_login'

  #friends
  get '/friends'=> 'page#friends'
  get '/request_friend/:id' => 'users#request_friend', as: 'request'
  get '/add_friend/:id' => 'users#add_friend', as: 'accept'
  get '/remove_friend/:id' => 'users#remove_friend', as: 'remove'
  get '/cancel_request/:id' => 'users#cancel_request', as: 'cancel'
  get '/ignore_request/:id' => 'users#ignore_request', as: 'ignore'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

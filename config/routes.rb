Rails.application.routes.draw do
  root 'page#index'

  get '/questionnaire' => 'responses#new'
  post '/questionnaire' => 'responses#create'

  get '/register' => 'users#new'
  resources :users
  resources :responses

# routes for login form, logging in, and logging out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/github', as: 'github_login'
  get 'auth/facebook', as: 'facebook_login'

  #friends
  get '/request_friend/:id' => 'users#request_friend', as: 'request'
  get '/add_friend/:id' => 'users#add_friend', as: 'accept'
  get '/remove_friend/:id' => 'users#remove_friend', as: 'remove'
  get '/cancel_request/:id' => 'users#cancel_request', as: 'cancel'
  get '/ignore_request/:id' => 'users#ignore_request', as: 'ignore'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

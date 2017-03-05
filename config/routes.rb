Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  root 'page#index'

  get '/questionnaire' => 'responses#new'
  post '/questionnaire' => 'responses#create'

  get '/register' => 'users#new'
  get '/signup',  to: 'users#new'
  resources :users
  resources :responses
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

# routes for login form, logging in, and logging out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/request_friend/:id' => 'users#request_friend', as: 'request'
  get '/add_friend/:id' => 'users#add_friend', as: 'accept'
  get '/remove_friend/:id' => 'users#remove_friend', as: 'remove'
  get '/cancel_request/:id' => 'users#cancel_request', as: 'cancel'
  get '/ignore_request/:id' => 'users#ignore_request', as: 'ignore'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

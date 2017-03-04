Rails.application.routes.draw do
  root 'page#index'

  get '/questionnaire' => 'responses#new'
  patch '/questionnaire' => 'responses#create'

  get '/register' => 'users#new'
  resources :users
  resources :responses

# routes for login form, logging in, and logging out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/request_friend/:id' => 'users#request_friend', as: 'request'
  get '/add_friend/:id' => 'users#add_friend', as: 'accept'
  get '/remove_friend/:id' => 'users#remove_friend', as: 'remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

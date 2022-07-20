# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  get '/discover', to: 'users#discover'
  get '/register', to: 'users#new'
  get '/users/:id/movies', to: 'movies#index'
  get 'users/:user_id/movies/:movie_id/show', to: 'movies#show'
  get 'users/:user_id/movies/:movie_id', to: 'movies#show'
  post '/register', to: 'users#create'
  get 'users/:user_id/movies/:movie_id/viewing_party/new', to: 'parties#new'
  post 'users/:user_id/movies/:movie_id/viewing_party', to: 'parties#create'
end

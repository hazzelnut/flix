Rails.application.routes.draw do
  resources :genres
  root 'movies#index'
  # get 'movies' => 'movies#index'
  # get 'movies/:id' => 'movies#show', as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  # patch 'movies/:id' => 'movies#update'

  get 'movies/filter/:filter' => 'movies#index', as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resources :users

  get 'signup' => 'users#new'

  resource :session, only: [:new, :create, :destroy]

  get 'signin' => 'sessions#new'
end

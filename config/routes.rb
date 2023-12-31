Rails.application.routes.draw do
  resources :favorites
  root 'movies#index'
  # get 'movies' => 'movies#index'
  # get 'movies/:id' => 'movies#show', as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  # patch 'movies/:id' => 'movies#update'

  resources :movies do
    resources :reviews
  end

  resources :users

  get 'signup' => 'users#new'

  resource :session, only: [:new, :create, :destroy]

  get 'signin' => 'sessions#new'
end

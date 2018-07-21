Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create]
  resources :stations, param: :slug, only: [:index]
  resources :trips, only: [:index, :show]

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'

  get '/:slug', to: 'stations#show'
end

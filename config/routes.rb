Rails.application.routes.draw do

  root 'welcome#index'
  resources :stations, param: :slug, only: [:index]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :conditions

  get '/:slug', to: 'stations#show'
end

Rails.application.routes.draw do

  root 'welcome#index'

  resources :stations, only: [:index, :show]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :trips, only: [:edit]
  end

  resources :conditions

  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/stations-dashboard', to: 'stations#dashboard'
end

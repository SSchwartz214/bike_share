Rails.application.routes.draw do

  root 'welcome#index'

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  post '/cart', to: 'carts#checkout'
  resources :stations, only: [:index, :show, :destroy]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :update]

  namespace :admin do
    resources :stations, only: [:edit, :update, :new, :create]
    resources :dashboard, only: [:index]
    resources :trips, only: [:new, :create, :edit, :update, :destroy]
    resources :conditions, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :accessories, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  get '/bike-store', to: 'accessories#index'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/stations-dashboard', to: 'stations#dashboard'
end

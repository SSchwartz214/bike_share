Rails.application.routes.draw do

  root 'welcome#index'

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  post '/cart', to: 'carts#update'
  post '/cart/remove_item', to: 'carts#remove_item'
  post '/checkout', to: 'carts#checkout'
  get '/new_order', to: 'orders#create'
  resources :stations, only: [:index]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:show, :update, :create]

  namespace :admin do
    resources :stations, only: [:edit, :update, :new, :create, :destroy]
    resources :dashboard, only: [:index]
    resources :trips, only: [:new, :create, :edit, :update, :destroy]
    resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    resources :accessories, except: [:new]
    get '/bike-shop/new', to: "accessories#new"
    resources :orders, only: [:show]
    get "bike-shop", to: "accessories#index"
  end

  resources :accessories, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  get '/bike-shop', to: 'accessories#index'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/conditions-dashboard', to:'conditions#dashboard'
  get '/stations-dashboard', to: 'stations#dashboard'
  get '/trips-dashboard', to: 'trips#dashboard'
  get '/:id', to: 'stations#show', as: :station
end

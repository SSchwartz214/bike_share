Rails.application.routes.draw do

  root 'welcome#index'

  # resources :carts, only: [:create]
  post '/carts', to: 'carts#create'

  get '/cart', to: 'carts#show'
  post '/cart', to: 'carts#update'
  post '/cart/remove_item', to: 'carts#remove_item'
  post '/checkout', to: 'carts#checkout'
  get '/new_order', to: 'orders#create'

  # resources :stations, only: [:index]
  get '/stations', to: 'stations#index'

  # resources :trips, only: [:index, :show]
  get '/trips', to: 'trips#index'
  get '/trips/:id', to: 'trips#show'

  # resources :users, only: [:new, :create, :edit, :update]
  get '/users/new', to: 'trips#new'
  post '/users', to: 'trips#create'
  get '/users/:id/edit', to: 'trips#edit'
  patch '/users/:id', to: 'trips#update'

  # resources :orders, only: [:show, :update, :create]
  get '/orders/:id', to: 'orders#show'
  patch '/orders/:id', to: 'orders#update'
  post '/orders', to: 'orders#create'

  namespace :admin do
    # resources :stations, only: [:edit, :update, :new, :create, :destroy]
    get 'admin/stations/:id/edit', to: 'admin/stations#edit'
    patch 'admin/stations/:id', to: 'admin/stations#update'
    get 'admin/stations/new', to: 'admin/stations#new'
    post 'admin/stations', to: 'admin/stations#create'
    delete 'admin/stations/:id', to: 'admin/stations#destroy'

    # resources :dashboard, only: [:index]
    get 'admin/dashboard', to: 'admin/dashboard#index'

    # resources :trips, only: [:new, :create, :edit, :update, :destroy]
    get 'admin/trips/new', to: 'admin/trips#new'
    post 'admin/trips', to: 'admin/trips#create'
    get 'admin/trips/:id/edit', to: 'admin/trips#edit'
    patch 'admin/trips/:id', to: 'admin/trips#update'
    delete 'admin/trips/:id', to: 'admin/trips#destroy'

    # resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    get 'admin/conditions/new', to: 'admin/conditions#new'
    post 'admin/conditions', to: 'admin/conditions#create'
    get 'admin/conditions/:id/edit', to: 'admin/conditions#edit'
    patch 'admin/conditions', to: 'admin/conditions#update'
    delete 'admin/conditions/:id', to: 'admin/conditions#destroy'

    # resources :accessories, except: [:new]
    get 'admin/accessories/new', to: 'admin/accessories#new'

    get 'admin/bike-shop/new', to: "admin/accessories#new"

    # resources :orders, only: [:show]
    get 'admin/orders/:id', to: 'admin/orders#show'

    get "admin/bike-shop", to: "admin/accessories#index"
  end

  # resources :accessories, only: [:index, :show]
  get '/accessories', to: 'accessories#index'
  get '/accessories/:id', to: 'accessories#show'

  resources :conditions, only: [:index, :show]
  get '/conditions', to: 'conditions#index'
  get '/conditions/:id', to: 'conditions#show'


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

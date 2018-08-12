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
  get '/trips/:id', to: 'trips#show', as: 'trip'

  # resources :users, only: [:new, :create, :edit, :update]
  get '/users/new', to: 'users#new', as: 'new_user'
  get 'users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  # resources :orders, only: [:show, :update, :create]
  get '/orders/:id', to: 'orders#show', as: 'order'
  put '/orders/:id', to: 'orders#update'
  post '/orders', to: 'orders#create'

  # namespace :admin do
    # resources :stations, only: [:edit, :update, :new, :create, :destroy]
    get 'admin/stations/new', to: 'admin/stations#new', as: 'new_admin_station'
    post 'admin/stations', to: 'admin/stations#create'
    put 'admin/stations/:id', to: 'admin/stations#update'
    patch 'admin/stations/:id', to: 'admin/stations#update'
    get 'admin/stations/:id/edit', to: 'admin/stations#edit', as: 'edit_admin_station'
    delete 'admin/stations/:id', to: 'admin/stations#destroy', as: 'admin_station'

    # resources :dashboard, only: [:index]
    get 'admin/dashboard', to: 'admin/dashboard#index', as: 'admin_dashboard_index'

    # resources :trips, only: [:new, :create, :edit, :update, :destroy]
    get 'admin/trips/new', to: 'admin/trips#new', as: 'new_admin_trip'
    post 'admin/trips', to: 'admin/trips#create'
    get 'admin/trips/:id/edit', to: 'admin/trips#edit', as: 'edit_admin_trip'
    patch 'admin/trips/:id', to: 'admin/trips#update'
    delete 'admin/trips/:id', to: 'admin/trips#destroy', as: 'admin_trip'

    # resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    get 'admin/conditions/new', to: 'admin/conditions#new', as: 'new_admin_condition'
    post 'admin/conditions', to: 'admin/conditions#create'
    get 'admin/conditions/:id/edit', to: 'admin/conditions#edit', as: 'edit_admin_condition'
    patch 'admin/conditions/:id', to: 'admin/conditions#update'
    delete 'admin/conditions/:id', to: 'admin/conditions#destroy', as: 'admin_condition'

    # resources :accessories, except: [:new]
    get 'admin/accessories/new', to: 'admin/accessories#new', as: 'admin_accessories_new'
    post 'admin/accessories', to: 'admin/accessories#create'
    get 'admin/accessories/:id/edit', to: 'admin/accessories#edit', as: 'edit_admin_accessory'
    put 'admin/accessories/:id', to: 'admin/accessories#update'
    patch 'admin/accessories/:id', to: 'admin/accessories#update'
    delete 'admin/accessories/:id', to: 'admin/accessories#destroy', as: 'admin_accessory'

    get 'admin/bike-shop/new', to: "admin/accessories#new" , as: 'admin_bike_shop_new'

    # resources :orders, only: [:show]
    get 'admin/orders/:id', to: 'admin/orders#show', as: 'admin_order'

    get "admin/bike-shop", to: "admin/accessories#index"
  # end

  # resources :accessories, only: [:index, :show]
  get '/accessories', to: 'accessories#index'
  get '/accessories/:id', to: 'accessories#show', as: 'accessory'

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

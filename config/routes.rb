Rails.application.routes.draw do

  root 'welcome#index'

  resources :stations, only: [:index, :show, :destroy]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create]

  namespace :admin do
<<<<<<< HEAD
    resources :stations, only: [:edit, :update]
  end

  resources :conditions
=======
    resources :dashboard, only: [:index]
  end
>>>>>>> 6e85a68ea8bbb81d45bd02b9a9663d616c571832

  resources :conditions, only: [:index, :show, :update, :edit, :destroy, :create]

  get "admin/condition/new", to: 'conditions#new'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/stations-dashboard', to: 'stations#dashboard'
end

Rails.application.routes.draw do

  root 'welcome#index'

  resources :stations, only: [:index, :show, :destroy]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create]

  namespace :admin do
    resources :stations, only: [:edit, :update, :new, :create]
    resources :dashboard, only: [:index]
    resources :trips, only: [:edit, :update, :destroy]
  end

  resources :conditions

  get "admin/condition/new", to: 'conditions#new'
  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/stations-dashboard', to: 'stations#dashboard'
end

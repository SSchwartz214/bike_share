Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'welcome#index'
  resources :stations, param: :slug, only: [:index]
  resources :trips, only: [:index, :show]
  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'


  resources :conditions

  get '/:slug', to: 'stations#show'
end

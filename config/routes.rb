Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stations, param: :slug, only: [:index]
  resources :trips, only: [:index, :show]

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'

  get '/:slug', to: 'stations#show'
  resources :conditions
end

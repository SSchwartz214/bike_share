Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new]
  resources :stations, param: :slug, only: [:index]
  resources :trips, only: [:index, :show]

  get '/:slug', to: 'stations#show'
  get '/login', to: 'login#index'
end

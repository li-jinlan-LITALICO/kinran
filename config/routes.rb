Rails.application.routes.draw do

  root 'items#index'

  get 'sessions/new'

  get '/login',   to: 'sessions#new'

  post '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  post '/tags',   to: 'tags#create'

  get '/cart',   to: 'cart_items#index'

  resources :items
  resources :tags
  resources :users
  # get  '/help',    to: 'static_pages#help', as: 'helf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

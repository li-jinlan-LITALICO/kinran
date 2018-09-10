Rails.application.routes.draw do
  root 'items#index'

  get '/cart',   to: 'cart_items#index'

  get '/login',   to: 'users#login'

  post '/login',   to: 'users#login'

  post '/tags',   to: 'tags#create'

  resources :items
  resources :tags
  resources :users
  # get  '/help',    to: 'static_pages#help', as: 'helf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

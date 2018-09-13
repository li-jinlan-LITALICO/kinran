Rails.application.routes.draw do

  root 'items#index'

  get 'sessions/new'

  # 無くて良い機能
  get '/signup',   to: 'users#new'

  # 無くて良い機能
  post '/signup',  to: 'users#create'

  get '/login',   to: 'sessions#new'

  post '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  post '/tags',   to: 'tags#create'

  get '/cart',   to: 'cart_items#index'

  resources :tags do
    member do
      get :relative_items
    end
  end

  resources :items
  resources :users
  # get  '/help',    to: 'static_pages#help', as: 'helf'
end

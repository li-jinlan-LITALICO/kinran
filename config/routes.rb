Rails.application.routes.draw do

  root 'items#index'

  get 'sessions/new'

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

  resources :users do
    member do
      get :add_cart_items
      post :add_cart_items
    end
  end

end

Rails.application.routes.draw do
  root 'home#index'

  get 'cart_items/index'

  get 'tags/create'

  get 'items/index'

  get 'users/new'

  resources :items
  resources :tags  
  resources :users
  # get  '/help',    to: 'static_pages#help', as: 'helf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

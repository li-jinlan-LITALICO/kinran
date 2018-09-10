Rails.application.routes.draw do
  get 'tags/create'

  get 'items/index'

  get 'users/new'

  root 'home#index'
  # get  '/help',    to: 'static_pages#help', as: 'helf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

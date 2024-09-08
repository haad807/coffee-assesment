Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :coffee_shops, only: %i[index]
  resources :items, only: %i[index]

  resource :orders
end

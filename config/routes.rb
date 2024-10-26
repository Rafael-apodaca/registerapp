Rails.application.routes.draw do
  resources :products, only: [:index]
  resources :carts, only: [:show, :create, :destroy] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  root 'products#index'
end

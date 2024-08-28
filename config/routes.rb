Rails.application.routes.draw do
  get 'wishlist_items/create'
  get 'wishlist_items/destroy'
  get 'wishlists/show'
  resources :carts, only: [:index]
  resources :cart_items, only: [:create,:update,:destroy]
  resources :wishlists, only: [:show]
  resources :wishlist_items, only: [:create,:destroy]
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get "sellerProduct", to: 'products#sellerProduct'
  root 'home#index'
  resources :homes
  resources :products
  resource :sellers
end

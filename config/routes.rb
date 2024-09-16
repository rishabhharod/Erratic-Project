Rails.application.routes.draw do
  root 'home#index'
  get 'sellerProduct', to: 'products#sellerProduct'

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :addresses do
    member do
      post :update_selected
    end
  end

  resources :carts, only: [:index]

  resources :cart_items, only: [:create,:update,:destroy]

  resources :wishlists, only: [:show]

  resources :wishlist_items, only: [:create,:destroy]

  resources :homes

  resources :products

  resource :seller
end

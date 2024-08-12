Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get "products/sellerProduct"
  root 'home#index'
  resources :homes
  resources :products
  resource :sellers
end

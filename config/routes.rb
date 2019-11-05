Rails.application.routes.draw do
  devise_for :users
  root to: 'products#header_index'
  resources :products
  resources :users
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'products#footer'
  resources :products
  resources :users
end

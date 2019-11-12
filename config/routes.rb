Rails.application.routes.draw do
  devise_for :users
  root to: 'products#show'
  resources :products
  resources :likes, only: [:create, :destroy]
  resources :users, only: [:index, :edit, :show] do
    collection do
      get 'card'
    end
  end
  resources :pages, only: [:index]
end
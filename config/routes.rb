Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :users, only: [:index, :edit,:card] do
    collection do
      get 'card'
    end
  end
  resources :pages, only: [:index, :new]
end
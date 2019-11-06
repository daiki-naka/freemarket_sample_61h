Rails.application.routes.draw do
  devise_for :users
  root to: 'products#footer'
  resources :products
  resources :users, only: [:index, :edit] do
    collection do
      get 'card'
    end
  end
  resources :pages, only: [:index]
end
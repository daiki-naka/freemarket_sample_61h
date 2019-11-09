Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :users, only: [:index, :edit, :card] 
  resources :pages, only: [:index, :new]
  resources :cards, only: [:index, :new, :create, :destroy]

  resources :products do
    collection do
      get 'buy'
      post 'pay'
    end
  end

  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
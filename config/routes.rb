Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :users, only: [:index, :edit,:card] do
    collection do
      get 'card'
    end
  end
  resources :signup do
    collection do
      get 'form1'
      get 'form2'
      get 'form3'
      get 'form4'
      get 'complete'
    end
  end
  resources :pages, only: [:index, :new]
end
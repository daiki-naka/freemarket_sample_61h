Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :users do
    collection do
      get 'card'
    end
    collection do
      get 'signup/form1'
      get 'signup/form2'
      get 'signup/form3'
      get 'signup/form4'
      get 'signup/complete'
    end
  end

  resources :pages, only: [:index, :new]
end
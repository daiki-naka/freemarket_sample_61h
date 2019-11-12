Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :users, only: [:index, :edit, :card] 
  resources :pages, only: [:index, :new]
  resources :cards, only: [:index, :new, :create, :destroy]
  resources :products

  resources :products do
    member do
      get 'product_show'
    end
    
    collection do
      get 'buy'
      post 'pay'
      get 'products/children_category', defaults: { format: 'json' }
      get 'products/grandchild_category', defaults: { format: 'json' }
      get 'products/product_size_brand', defaults: { format: 'json' }
      get 'products/brand_search', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:index, :edit,:card] do
    collection do
      get 'card'
    end
  end

end

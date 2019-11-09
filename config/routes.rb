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
  resources :pages, only: [:index, :new]
  resources :products do 
    collection do
      get 'children_category', defaults: { format: 'json' }
      get 'grandchild_category', defaults: { format: 'json' }
      get 'product_size_brand', defaults: { format: 'json' }
      get 'brand_search', defaults: { format: 'json' }
    end
  end
  
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

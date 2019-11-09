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
  resources :products do 
    collection do
      get 'children_category', defaults: { format: 'json' }
      get 'grandchild_category', defaults: { format: 'json' }
      get 'product_size_brand', defaults: { format: 'json' }
      get 'brand_search', defaults: { format: 'json' }
    end
  end
end


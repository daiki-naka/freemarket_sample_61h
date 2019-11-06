Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  
  resources :products do 
    collection do
      get 'children_category', defaults: { format: 'json' }
      get 'grandchild_category', defaults: { format: 'json' }
      get 'product_size_brand', defaults: { format: 'json' }
      get 'brand_search', defaults: { format: 'json' }
    end
  end
end

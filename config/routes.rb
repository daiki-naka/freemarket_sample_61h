Rails.application.routes.draw do
  devise_for :users
  root to: 'products#show'
  resources :likes, only: [:create, :destroy]
  resources :pages, only: [:index, :new]
  resources :cards, only: [:index, :new, :create, :destroy]
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
  resources :users, only: [:index,:edit,:show] do
    member do
      get 'identification'
      get 'logout'
    end
    collection do
      get 'card'
      get 'signup/step1'
      get 'signup/step2'
      get 'signup/step3'
      get 'signup/step4'
      get 'signup/complete'
    end
  end
end


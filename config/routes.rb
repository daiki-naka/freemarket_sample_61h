Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'signup/form1'
      get 'signup/form2'
      get 'signup/form3'
      get 'signup/form4'
      get 'signup/complete'
    end
  end
end

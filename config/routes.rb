Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "items#index"
  resources :items  do
    resources :comments,only:[:create]
    resources :likes
    resources :deliver_addresses
  end
  resources :users do
    member do
      get 'listing'
    end
  end
end

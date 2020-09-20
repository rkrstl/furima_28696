Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "items#index"
  resources :items  do
    resources :comments,only:[:create]
    resources :likes
    resources :deliver_addresses
    collection do 
      get 'search'
    end
  end
  resources :users do
    member do
      get 'listing'
    end
    member do
      get 'likes'
    end
  end
end

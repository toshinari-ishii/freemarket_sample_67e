Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only:[:new, :show] do
    member do
      get 'buy'
      get 'confirm'
    end
  end
  resources :gets, only:[:show]
  resources :users, only: [:show]
end
   
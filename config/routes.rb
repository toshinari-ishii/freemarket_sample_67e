Rails.application.routes.draw do
  devise_for :users
  root to: 'gets#index'
  resources :items, only:[:new, :show] do
    member do
      get 'buy'
      get 'confirm'
    end
  end
  resources :gets, only:[:show]
end

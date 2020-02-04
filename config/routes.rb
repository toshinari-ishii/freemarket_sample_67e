Rails.application.routes.draw do
  devise_for :users
  root to: 'gets#index'
  resources :items, only:[:new, :show]
  resources :gets, only:[:show]
end
   
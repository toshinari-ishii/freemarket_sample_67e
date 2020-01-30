Rails.application.routes.draw do
  devise_for :users
  root to: 'gets#index'
  resources :items, only:[:new, :show]
end

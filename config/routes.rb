Rails.application.routes.draw do
  root to: 'gets#index'
  resources :items, only:[:new, :show]
end

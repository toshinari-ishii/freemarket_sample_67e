Rails.application.routes.draw do
  devise_for :users
  root to: 'gets#index'
end

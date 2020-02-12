Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items, only:[:new, :show, :destroy,:create] do
    member do
      get 'buy'
      get 'confirm'
    end
    collection do
      get 'children', defaults: { format: 'json' }
      get 'grandchildren', defaults: { format: 'json' }
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :users, only: [:show]
end
   
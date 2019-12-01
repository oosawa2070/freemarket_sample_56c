Rails.application.routes.draw do

  devise_for :users, controllers:{ omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'products#index'
  resources :mypage, only: [:index]
  resources :products, only: [:index, :show, :new, :buy, :done, :create] do
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
  end
  resources :confirm, only: [:index]
  resources :users, only: [:edit, :update, :index] do
    collection do
      get 'logout'
    end
  end
  namespace :transaction do
    resources :buy, only: [:index]
    resources :sell, only: [:index]
  end
  resources :new_register do
    collection do
      get 'index', 'phone_number','address','credit','complete'
    end
  end
  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'
  resources :credit_card, only: [:new, :show, :index] do
    collection do
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
end

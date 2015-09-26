Rails.application.routes.draw do
  devise_for :admin_users, skip: :registrable

  resource :passwords, only: [:edit] do
    collection do
      patch 'update'
    end
  end

  root to: 'home#index'

  resources :transactions do
    collection do
      match 'search' => 'transactions#search', via: [:get, :post], as: :search
    end
  end

  resources :admin_users

  get 'report' => 'report#index'
  resources :messages
end

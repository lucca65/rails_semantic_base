Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, skip: :registrable
  root to: 'home#index'

  resources :admin_users
  resources :messages
  resource :passwords, only: [:edit] do
    collection do
      patch 'update'
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :users
    post 'users/sign_in', to: 'users#sign_in'
  end

end

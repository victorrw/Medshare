Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :meds
  resources :shares, only: [:index, :create]
  # resources :users, only: [:new, :create, :edit, :update, :show] do end
end

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users,
    # added controllers for omniauth with facebook
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  resources :meds
  resources :shares, only: [:new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update]
end

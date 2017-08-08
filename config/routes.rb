Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users,
    # added controllers for omniauth with facebook
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :meds
  resources :shares, only: [:index, :create]
  # removed resources :users, only: [:new, :create, :edit, :update, :show] do end
end

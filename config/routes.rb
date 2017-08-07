Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :meds
  end

  resources :shares, only: [:index, :create, :edit, :update]
end

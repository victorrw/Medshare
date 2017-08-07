Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :meds
  end

  resources :shares, only: [:index, :create]
end

Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :meds
  end
  resources :shares, only: [:index, :create, :edit, :update]
end

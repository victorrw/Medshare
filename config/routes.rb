Rails.application.routes.draw do
  resources :user do, only: [:new, :create, :edit, :update, :show]
    resources :med
  end
  resources :share, only: [:index, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

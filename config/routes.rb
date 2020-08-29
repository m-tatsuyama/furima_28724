Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new]
  resources :users, only: [:index, :create, :edit, :update, :show]
end

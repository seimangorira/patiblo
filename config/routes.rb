Rails.application.routes.draw do
  devise_for :users
  root "blog#index"
  resources :blog
  resources :users, only: [:show]
end

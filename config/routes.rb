Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :followings, only: [:new, :create, :index, :destroy]
  resources :opinions, only: [:new,:create,:index, :show]

  root 'opinions#index'
end

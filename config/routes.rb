Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :followings, only: [:new, :create, :index, :destroy]
  resources :opinions, only: [:new,:create,:index]
  

  root 'sessions#new'
end

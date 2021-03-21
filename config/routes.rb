Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :followings, only: [:new, :create, :index, :destroy]
  resources :opinions, only: [:new,:create,:index, :show]
  # get 'opinions/new', to: 'opinions#show'
  # post 'opinions/new', to: 'opinions#create'
  # get 'opinions/show', to: 'opinions#show'

  root 'opinions#index'
end

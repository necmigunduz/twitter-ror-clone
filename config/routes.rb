Rails.application.routes.draw do
  root 'users#create'

  resources :users, only: [:new,:create,:index, :show]
end

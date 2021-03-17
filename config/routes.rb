Rails.application.routes.draw do
  get 'users/sign_up', to: 'users#sign_up'
  post 'users/sign_up', to: 'users#sign_up'
end

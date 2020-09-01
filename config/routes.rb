Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'users/index'
  root to: "users#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
resources:users, only:[:index, :new, :create, :destroy]
resources :articles
resources :statuss
resources :shippingfees
end

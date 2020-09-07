Rails.application.routes.draw do
  resources :items, only:[:index, :new, :create, :update, :show,:edit,:update,:destroy]

  get 'sessions/new'
  devise_for :users
  root to: "items#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :orders, only:[:create]
end

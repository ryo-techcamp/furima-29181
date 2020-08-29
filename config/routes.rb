Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end

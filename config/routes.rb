Rails.application.routes.draw do
  resources :items, only:[:index, :new, :create, :update, :show,:edit,:update,:destroy] 
  resources :shipping_address, only:[:show,:index,:create]
  
  resources :items do
    resources :shipping_address
  end
  # get '/shipping_address/:id',to:'items/show'

  get 'sessions/new'
  devise_for :users
  root to: "items#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  put "/disable", to: "users#disable"
  put "/enable", to: "users#enable"
  put "/upgrade", to: "users#upgrade"
  put "/disableitem", to: "items#disable"
  put "/enableitem", to: "items#enable"
  get "/profile/orders", to: "orders#index"
  get '/carts', to: 'carts#index'
  get '/cart', to: 'carts#index'
  delete '/cart', to: 'carts#destroy'
  post 'cart/:id/subtract', to: 'carts#subtract_item'


  namespace :dashboard do
    root to: "users#index"
    resources :users

    root to: "items#index"
    resources :items
  end

  resources :orders
  resources :welcome, only: [:index]
  resources :items
  resources :users, except: [:destroy]

  resources :carts, only: [:create]
end

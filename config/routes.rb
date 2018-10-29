Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  put "/disable", to: "users#disable"
  put "/enable", to: "users#enable"
  # get '/dashboard', to: 'dashboard#user', as:'dashboard'

  # namespace :dashboard do
  #   get '', to: 'dashboard#index'
  #   # root to: "dashboard#user"
  # end
  namespace :dashboard do
    root to: "users#index"
    resources :users

    root to: "items#index"
    resources :items
  end

  resources :welcome, only: [:index]
  resources :items
  resources :users, except: [:destroy]
end

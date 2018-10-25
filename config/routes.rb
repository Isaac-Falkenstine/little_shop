Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'

  namespace :dashboard do
    resources :items, only: [:new, :create, :andothershit]
  end

  resources :welcome, only: [:index]
  resources :items
  resources :users, except: [:destroy]
end

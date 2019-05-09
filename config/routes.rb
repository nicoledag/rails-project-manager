Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users
  resources :projects
  resources :clients
  resources :comments, only: [:new, :create, :edit, :update, :destroy]

  resources :projects do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :clients do
    resources :projects
  end

end

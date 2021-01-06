Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  
  get '/contact', to: 'static_pages#contact'
  get "/home", to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/users', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'

  get 'foo/bar'
  get 'foo/baz'
  
  resources :microposts, only: [:create, :destroy]
  resources :users
end

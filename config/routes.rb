Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/home',     to: 'static_pages#home'
  get  '/about',    to: 'static_pages#about'

  get  '/signup',   to: 'users#new'
  post '/signup',   to: 'users#create'
  resources :users

  get      '/login',  to: 'sessions#new'
  post     '/login',  to: 'sessions#create'
  delete   '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'

  post '/posts/new', to: 'posts#create'
  resources :posts

  resources :replies

  get      '/search',  to: 'search#index'

end

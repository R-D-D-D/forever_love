Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'sessions/new'
  get 'static_pages/home'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'static_pages/home'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
  resources :events do
    member do
      get :photos
      get :videos
    end
  end
  resources :videos
  resources :photos
end

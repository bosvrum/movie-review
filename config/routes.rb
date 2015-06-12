Rails.application.routes.draw do
  
  resources :genres
  root 'movies#index'
  resource :session
  get 'signin' => 'sessions#new'
  get 'signup' => 'users#new'
  resources :users
  resources :movies do 
    resources :reviews
    resources :favorites
  end
end

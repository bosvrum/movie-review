Rails.application.routes.draw do
  
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

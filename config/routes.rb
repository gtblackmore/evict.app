Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :tenants, only: [:index, :destroy]
  resources :properties do
    resources :tenants, only: [:new, :edit, :update, :create, :show]
  end 
  
  get '/home', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
  root 'users#show'

end

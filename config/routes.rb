Rails.application.routes.draw do
 root 'users#home'

 resources :users, only: [:new, :create]
 resources :events, only: [:new, :create, :index, :show]

 get 'login', to: "sessions#new"
 post 'login', to: "sessions#create"
 delete 'logout', to: "sessions#destroy"
 get 'signup', to: "users#new"
end

Rails.application.routes.draw do
  resource :sessions
  get  'users/signup', to: 'users#new', as: 'new_user_registration'
  get 'users/login', to: 'sessions#new', as: 'new_user_session'
  get 'users/logout', to: 'sessions#destroy', as: 'destroy_user_session'
  # post 'users/login' to: 'sessions#create', as: 'users/login'
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end

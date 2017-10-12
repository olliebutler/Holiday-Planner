Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :groups

  get 'groups/new', to: 'groups#new'
  post 'groups/new', to: 'groups#create'
end

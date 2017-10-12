Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :groups
  resources :invites



  post 'groups/invite', to: 'invite#create'
  get 'groups/new', to: 'groups#new'
  post 'groups/new', to: 'groups#create'
end

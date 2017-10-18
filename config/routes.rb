Rails.application.routes.draw do
  resources :unavailabilities
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :groups
  resources :comments


  resources :invites

  post '/groups/invite/accept', to: 'invites#accept'
  post 'groups/invite', to: 'invite#create'
  get 'groups/new', to: 'groups#new'
  post 'groups/new', to: 'groups#create'
  post 'groups/:id/upload', to: 'groups#uploadpic'
  patch 'groups/:id/upload', to: 'groups#uploadpic'
end

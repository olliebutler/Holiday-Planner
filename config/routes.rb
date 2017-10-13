Rails.application.routes.draw do
  resources :unavalibilities
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :groups
  resources :invites

  post '/groups/invite/accept', to: 'invites#accept'
  post 'groups/invite', to: 'invite#create'
  get 'groups/new', to: 'groups#new'
  post 'groups/new', to: 'groups#create'
end

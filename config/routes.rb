Rails.application.routes.draw do
  resources :unavailabilities
  root to: 'visitors#index'
  devise_for :users
  resources  :users

  resources :groups

  resources :user_groups do
    member do
      delete "remove", to: "user_groups#destroy"
    end
  end

  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end


  resources :invites

  post '/groups/invite/accept', to: 'invites#accept'
  post 'groups/invite', to: 'invite#create'
  get 'groups/new', to: 'groups#new'
  post 'groups/new', to: 'groups#create'
  post 'groups/:id/upload', to: 'groups#upload_pic'
  patch 'groups/:id/upload', to: 'groups#upload_pic'
  get 'groups/:id/users/:user_id', to: 'groups#show_user'
  delete 'groups/:id/users/:user_id', to: 'user_groups#destroy'
end

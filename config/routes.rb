Rails.application.routes.draw do
  get 'messages/create'
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'friends', to:'users#index'
  post 'friends', to:'friendships#create'
  get 'signup', to:'users#new'
  post 'signup', to:'users#create'

  resources :users, except: [:new]
  resources :friendships
  mount ActionCable.server, at: '/cable'
end

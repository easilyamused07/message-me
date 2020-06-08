Rails.application.routes.draw do
  get 'messages/create'
  get 'chatroom', to: 'chatroom#index'
  get 'login', to: 'sessions#new'
  root 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'friends', to:'users#index'
  get 'signup', to:'users#new'
  post 'signup', to:'users#create'

  resources :users, except: [:new]

  mount ActionCable.server, at: '/cable'
end

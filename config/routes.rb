Rails.application.routes.draw do
  get 'datasels/index'
  get 'datasels/show'
  get 'sessions/new'
  get 'users/new'
  get 'users/mypage'
  get 'users/erase'
  get 'users/edit'
  get 'topics/show'
  get 'events/index'
  root 'events#index'

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/users/edit', to: 'users#update'
end

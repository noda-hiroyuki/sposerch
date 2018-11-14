Rails.application.routes.draw do
  get 'datasels/search'
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
  resources :comments

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/users/edit', to: 'users#update'

  get 'topic/show/:id', to: 'topics#show',as: 'topicid_show'

  post '/comments', to: 'comments#create'

  post '/entrys', to: 'entrys#create'
  delete '/entrys', to: 'entrys#destroy'
end

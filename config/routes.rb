Rails.application.routes.draw do
  get 'datasels/search'
  get 'datasels/category'
  get 'datasels/keyword'
  get 'sessions/new'
  get 'users/new'
  get 'users/mypage'
  get 'users/erase'
  get 'users/edit'
  get 'events/index'
  root 'events#index'

  resources :users
  resources :comments

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/users/edit', to: 'users#update'
  post '/users/user_info_check', to: 'users#user_info_check'
  post '/users/mypage', to: 'users#mypage'

  get 'topic/show/:id', to: 'topics#show',as: 'topic_show'
  get 'topic/comment/:id', to: 'topics#comment',as: 'topic_comment'

  post '/comments/new', to: 'comments#comment_new'
  post '/comments/list', to: 'comments#comment_list'

  post '/datasels/category', to: 'datasels#category'
  post '/datasels/keyword', to: 'datasels#keyword'

  post '/entrys', to: 'entrys#create'
  delete '/entrys', to: 'entrys#destroy'

end

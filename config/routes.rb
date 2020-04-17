Rails.application.routes.draw do
  get 'memos/index' => "memos#index"
  get "memos/new" => "memos#new"
  get "memos/:id" => "memos#show"
  post "memos/create" => "memos#create"
  get "memos/:id/edit" => "memos#edit"
  post "memos/:id/update" => "memos#update"
  post "memos/:id/destroy" => "memos#destroy"

  post "favos/:memo_id/create" => "favos#create"
  post "favos/:memo_id/destroy" => "favos#destroy"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/memos" => "users#memos"
  get "users/:id/likes" => "users#likes"
  get "users/:id/favos" => "users#favos"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  get "about" => "home#about"
end



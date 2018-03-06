Rails.application.routes.draw do
  get 'sessions/new'


  resources :join_table_users_books
  resources :transactions
  resources :books
  resources :users
  resources :sessions

  post "users/signup" => 'users#signup'
  post "users/login" => 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

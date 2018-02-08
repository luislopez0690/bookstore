Rails.application.routes.draw do
  resources :join_table_users_books
  resources :transactions
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

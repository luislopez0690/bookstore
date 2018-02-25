class User < ApplicationRecord
  has_many :users_books
  has_many :transactions
  has_many :books, through: :users_books
  has_many :books, through: :transactions
end

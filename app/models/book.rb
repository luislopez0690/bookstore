class Book < ApplicationRecord
  has_many :users_books
  has_many :transactions
  has_many :users, through: :users_books
  has_many :users, through: :transactions
end

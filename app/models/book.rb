class Book < ApplicationRecord
  has_many :users, through: :JoinTableUsersBooks
end

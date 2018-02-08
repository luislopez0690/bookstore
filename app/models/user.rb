class User < ApplicationRecord
  has_many :books, through: :JoinTableUsersBooks
end

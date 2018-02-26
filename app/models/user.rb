class User < ApplicationRecord
  has_many :transactions
  has_many :books, through: :transactions
end

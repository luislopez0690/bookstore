class Book < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  def available_books
    
    total_bought_books = self.transactions.sum(:quantity)
    self.available = self.amount - total_bought_books
    self.save
  end
end

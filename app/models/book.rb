class Book < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
<<<<<<< HEAD

  def available_books
    
    total_bought_books = self.transactions.sum(:quantity)
    self.available = self.amount - total_bought_books
    self.save
  end
=======
>>>>>>> e421485dad613cc8ad215f360a6f4addb059b5b9
end

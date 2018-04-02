class User < ApplicationRecord
  has_many :transactions
  has_many :books, through: :transactions



def group_transactions_by_books
  grouped_sums = self.transactions.group(:book_id).sum(:quantity)
  total_array = self.books.map do |element|
  { name: element.name, author: element.author, amount: grouped_sums[element.id], id: element.id }
  end
  return total_array.uniq
end

def order_transactions_by_books
   return ordered_books = self.transactions.order(:book_id)
end
  def self.clean_input(params)
    params[:email] = params[:email].delete(' ')
    params[:email] = params[:email].downcase
    params[:password] = params[:password].delete(' ')
    if params[:name]
      params[:name] = params[:name].delete(' ')
    end
  end
end

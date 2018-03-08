class User < ApplicationRecord
  has_many :transactions
  has_many :books, through: :transactions


#REFACTOR clean_input function 
  def self.clean_input(params)
    params[:email] = params[:email].delete(' ')
    params[:email] = params[:email].downcase
    params[:password] = params[:password].delete(' ')
    if params[:name]
      params[:name] = params[:name].delete(' ')
    end
  end
end

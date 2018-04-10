class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validate :validate_correct_quantity
end

def validate_correct_quantity
  if self.quantity < 0 ||  self.quantity > self.book.available
    errors.add(:car, "Wrong amount of books, try again")
  end
end

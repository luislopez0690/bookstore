class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_numericality_of :quantity, greater_than: 0
end

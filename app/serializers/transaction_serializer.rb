class TransactionSerializer < ActiveModel::Serializer
  attributes :quantity
  belongs_to :user
  belongs_to :book
end

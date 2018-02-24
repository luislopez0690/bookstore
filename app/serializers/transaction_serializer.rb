class TransactionSerializer < ActiveModel::Serializer
  attributes :user,
  :book,
  :type,
  :quantity
end

class TransactionSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :book
end

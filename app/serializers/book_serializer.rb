class BookSerializer < ActiveModel::Serializer
  attributes :name,
  :author,
  :summary,
  :category,
  :description,
  :image_url,
  :price,
  :amount

  has_many :transactions
  has_many :users
end

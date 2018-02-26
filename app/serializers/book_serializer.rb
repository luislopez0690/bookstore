class BookSerializer < ActiveModel::Serializer
  attributes :name,
  :author,
  :summary,
  :description,
  :image_url,
  :price,
  :amount

  has_many :users
end

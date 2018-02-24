class BookSerializer < ActiveModel::Serializer
  attributes :name,
  :author,
  :short_description,
  :long_description,
  :image_url,
  :price,
  :amount

  has_many :users
end

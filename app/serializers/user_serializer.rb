class UserSerializer < ActiveModel::Serializer
  attributes :name,
  :user_type

  has_many :books
end

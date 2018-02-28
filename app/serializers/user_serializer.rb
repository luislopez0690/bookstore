class UserSerializer < ActiveModel::Serializer
  attributes :name,
  :password
  :user_type

  has_many :books
end

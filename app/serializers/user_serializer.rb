class UserSerializer < ActiveModel::Serializer
  attributes :name,
  :password,
  :email,
  :user_type

  has_many :books
end

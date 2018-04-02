class UserSerializer < ActiveModel::Serializer
  attributes :name,
  :password,
  :email,
  :user_type,
  :group_transactions,
  :order_transactions
  has_many :transactions
  has_many :books

  def group_transactions
    @instance_options[:group_transactions]
  end

  def order_transactions
    @instance_options[:order_transactions]
  end
end

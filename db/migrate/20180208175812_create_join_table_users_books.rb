class CreateJoinTableUsersBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :join_table_users_books do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end

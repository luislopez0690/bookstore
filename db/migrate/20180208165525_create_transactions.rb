class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :user
      t.string :book
      t.date :tStamp
      t.string :tType
      t.integer :orderNumber
      t.integer :quantity

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :user
      t.string :book
      t.string :type
      t.integer :quantity

      t.timestamps
    end
  end
end

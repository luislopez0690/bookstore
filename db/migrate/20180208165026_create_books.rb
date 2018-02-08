class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :sDescription
      t.string :lDescription
      t.string :image
      t.decimal :price
      t.integer :amount

      t.timestamps
    end
  end
end

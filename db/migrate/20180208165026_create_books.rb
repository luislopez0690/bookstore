class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :short_description
      t.string :long_description
      t.string :image_url
      t.decimal :price
      t.integer :amount

      t.timestamps
    end
  end
end

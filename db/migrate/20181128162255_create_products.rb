class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku
      t.decimal :price
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.decimal :amount
      t.integer :product_id
      t.integer :chart_id
      t.timestamps
    end
  end
end

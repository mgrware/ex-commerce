class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.decimal :total_amount
      t.boolean :payment_status, default: false
      t.timestamps
    end
  end
end

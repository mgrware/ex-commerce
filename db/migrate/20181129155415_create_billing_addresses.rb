class CreateBillingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_addresses do |t|
      t.integer :chart_id
      t.string  :email
      t.string  :address
      t.string  :card_number
      t.string  :phone_number
      t.string  :name
      t.timestamps
    end
  end
end

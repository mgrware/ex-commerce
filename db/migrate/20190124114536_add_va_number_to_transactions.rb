class AddVaNumberToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :billing_addresses, :va_number, :string
  end
end

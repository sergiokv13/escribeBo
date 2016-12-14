class AddComNumberToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :receipt_number, :string
  end
end

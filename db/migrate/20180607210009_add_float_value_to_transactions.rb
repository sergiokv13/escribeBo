class AddFloatValueToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :float_amount, :float
  end
end

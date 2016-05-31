class AddAprovedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :aproved, :boolean
  end
end

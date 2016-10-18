class AddConceptTypeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :concept_type, :text
  end
end

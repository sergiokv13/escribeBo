class AddChapterIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :chapter_id, :integer
  end
end

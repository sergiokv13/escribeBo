class AddAttachmentImageToTransactions < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :transactions, :image
  end
end

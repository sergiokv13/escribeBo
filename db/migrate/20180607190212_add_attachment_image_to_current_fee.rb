class AddAttachmentImageToCurrentFee < ActiveRecord::Migration
  def self.up
    change_table :current_fees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :current_fees, :image
  end
  
end

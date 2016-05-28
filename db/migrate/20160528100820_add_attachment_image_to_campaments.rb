class AddAttachmentImageToCampaments < ActiveRecord::Migration
  def self.up
    change_table :campaments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :campaments, :image
  end
end

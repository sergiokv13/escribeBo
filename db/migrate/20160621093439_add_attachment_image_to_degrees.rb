class AddAttachmentImageToDegrees < ActiveRecord::Migration
  def self.up
    change_table :degrees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :degrees, :image
  end
end

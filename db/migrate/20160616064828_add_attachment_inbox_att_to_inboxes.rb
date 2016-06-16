class AddAttachmentInboxAttToInboxes < ActiveRecord::Migration
  def self.up
    change_table :inboxes do |t|
      t.attachment :inbox_att
    end
  end

  def self.down
    remove_attachment :inboxes, :inbox_att
  end
end

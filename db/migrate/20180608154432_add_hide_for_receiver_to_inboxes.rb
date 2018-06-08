class AddHideForReceiverToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :inbox_hidden_sender, :boolean
  end
end

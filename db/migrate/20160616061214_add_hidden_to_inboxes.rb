class AddHiddenToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :inbox_hidden, :boolean
  end
end

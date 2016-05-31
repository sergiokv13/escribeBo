class AddSeenToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :seen, :boolean
  end
end

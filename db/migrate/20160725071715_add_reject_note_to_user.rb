class AddRejectNoteToUser < ActiveRecord::Migration
  def change
    add_column :users, :reject_note, :text
  end
end

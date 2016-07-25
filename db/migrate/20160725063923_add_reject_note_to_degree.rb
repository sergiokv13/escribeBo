class AddRejectNoteToDegree < ActiveRecord::Migration
  def change
    add_column :degrees, :reject_note, :text
  end
end

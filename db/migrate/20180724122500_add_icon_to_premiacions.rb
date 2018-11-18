class AddIconToPremiacions < ActiveRecord::Migration
  def up
    add_attachment :premiacions, :icon
  end

  def down
    remove_attachment :premiacions, :avataricon
  end
end

class RemoveUserIdFromPremiacions < ActiveRecord::Migration
  def change
    remove_reference :premiacions, :user, index: true, foreign_key: true
  end
end

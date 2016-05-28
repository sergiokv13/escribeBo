class AddCampamentReferenceToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :campament, index: true, foreign_key: true
  end
end

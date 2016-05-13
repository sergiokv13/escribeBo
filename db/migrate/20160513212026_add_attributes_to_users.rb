class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :chapter, index: true, foreign_key: true
    add_reference :users, :priory, index: true, foreign_key: true
    add_reference :users, :court, index: true, foreign_key: true
  end
end

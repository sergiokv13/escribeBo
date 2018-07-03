class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chapter_id, :integer
    add_column :users, :priory_id, :integer
    add_column :users, :court_id, :integer
  end
end

class AddAprovedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :president_aproved, :boolean
    add_column :users, :deputy_aproved, :boolean
    add_column :users, :oficial_aproved, :boolean
  end
end

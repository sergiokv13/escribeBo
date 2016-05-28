class AddAttributesToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :president_aproved, :boolean
    add_column :degrees, :deputy_aproved, :boolean
    add_column :degrees, :oficial_aproved, :boolean
  end
end

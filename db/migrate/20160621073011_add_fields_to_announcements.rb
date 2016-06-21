class AddFieldsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :president_aproved, :boolean
    add_column :announcements, :oficial_aproved, :boolean
  end
end

class AddPermissionsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :degrees, :string
    add_column :announcements, :charges, :string
  end
end

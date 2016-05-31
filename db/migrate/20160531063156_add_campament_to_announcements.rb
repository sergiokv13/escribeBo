class AddCampamentToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :campament, index: true, foreign_key: true
  end
end

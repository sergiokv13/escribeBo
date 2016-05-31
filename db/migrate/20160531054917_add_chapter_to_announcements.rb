class AddChapterToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :announcements, :chapter, index: true, foreign_key: true
  end
end

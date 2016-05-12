class AddChapterConsultantToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :chapter_consultant, index: true, foreign_key: true
  end
end

class AddChapterConsultantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chapter_consultant_id, :integer
  end
end

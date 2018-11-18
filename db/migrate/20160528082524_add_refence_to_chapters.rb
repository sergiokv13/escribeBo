class AddRefenceToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :chapter_consultant_president_id, :integer
  end
end

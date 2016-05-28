class AddRefenceToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :chapter_consultant_president, index: true, foreign_key: true
  end
end

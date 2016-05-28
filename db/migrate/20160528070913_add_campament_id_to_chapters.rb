class AddCampamentIdToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :campament, index: true, foreign_key: true
  end
end

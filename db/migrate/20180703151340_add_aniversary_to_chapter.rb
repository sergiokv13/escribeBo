class AddAniversaryToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :aniversary, :date
  end
end

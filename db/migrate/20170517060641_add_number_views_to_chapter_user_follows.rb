class AddNumberViewsToChapterUserFollows < ActiveRecord::Migration
  def change
    add_column :chapter_user_follows, :number_views, :integer
  end
end

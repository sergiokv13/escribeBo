class CreateChapterUserFollows < ActiveRecord::Migration
  def change
    create_table :chapter_user_follows do |t|
      t.references :user, index: true, foreign_key: true
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

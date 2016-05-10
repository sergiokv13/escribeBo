class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chapter_name
      t.string :chapter_type
      t.references :chapter_president, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

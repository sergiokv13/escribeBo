class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chapter_name
      t.string :chapter_type
      t.string :campament
      t.integer :chapter_president_id

      t.timestamps null: false
    end
  end
end

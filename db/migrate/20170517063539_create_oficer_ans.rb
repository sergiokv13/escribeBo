class CreateOficerAns < ActiveRecord::Migration
  def change
    create_table :oficer_ans do |t|
      t.string :text
      t.string :title
      t.date :deadline

      t.timestamps null: false
    end
  end
end

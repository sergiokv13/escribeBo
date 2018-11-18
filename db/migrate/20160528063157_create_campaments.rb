class CreateCampaments < ActiveRecord::Migration
  def change
    create_table :campaments do |t|
      t.string :name
      t.integer :president_id

      t.timestamps null: false
    end
  end
end

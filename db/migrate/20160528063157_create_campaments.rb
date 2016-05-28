class CreateCampaments < ActiveRecord::Migration
  def change
    create_table :campaments do |t|
      t.string :name
      t.references :president, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

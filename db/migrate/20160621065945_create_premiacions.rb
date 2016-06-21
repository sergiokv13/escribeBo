class CreatePremiacions < ActiveRecord::Migration
  def change
    create_table :premiacions do |t|
      t.string :title
      t.date :date_of
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

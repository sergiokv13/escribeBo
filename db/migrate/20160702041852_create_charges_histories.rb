class CreateChargesHistories < ActiveRecord::Migration
  def change
    create_table :charges_histories do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.references :campament, index: true, foreign_key: true
      t.references :chapter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

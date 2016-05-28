class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :description
      t.integer :mount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
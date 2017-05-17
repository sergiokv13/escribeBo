class CreateCampamentsUserFollows < ActiveRecord::Migration
  def change
    create_table :campaments_user_follows do |t|
      t.references :user, index: true, foreign_key: true
      t.references :campament, index: true, foreign_key: true
      t.integer :number_views

      t.timestamps null: false
    end
  end
end

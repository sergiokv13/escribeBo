class CreateCurrentFees < ActiveRecord::Migration
  def change
    create_table :current_fees do |t|

      t.timestamps null: false
    end
  end
end

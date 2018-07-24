class AddDateOfToUserPremiations < ActiveRecord::Migration
  def change
    add_column :user_premiations, :date_of, :date
  end
end

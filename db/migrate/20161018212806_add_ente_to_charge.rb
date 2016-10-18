class AddEnteToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :ente, :string
  end
end

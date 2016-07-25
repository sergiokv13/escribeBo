class AddGestionToChargesHistory < ActiveRecord::Migration
  def change
    add_column :charges_histories, :gestion, :string
  end
end

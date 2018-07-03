class AddFieldsToCharges < ActiveRecord::Migration
  def change
    add_reference :charges, :campament, index: true, foreign_key: true
    add_reference :charges, :chapter, index: true, foreign_key: true
  end
end

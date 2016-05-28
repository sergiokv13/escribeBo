class AddReferenceToDegrees < ActiveRecord::Migration
  def change
    add_reference :degrees, :chapter, index: true, foreign_key: true
  end
end

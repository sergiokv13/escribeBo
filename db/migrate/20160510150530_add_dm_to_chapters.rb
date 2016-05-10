class AddDmToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :demolay_in_charge, index: true, foreign_key: true
  end
end

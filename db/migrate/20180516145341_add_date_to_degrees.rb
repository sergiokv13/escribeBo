class AddDateToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :date, :datetime
  end
end

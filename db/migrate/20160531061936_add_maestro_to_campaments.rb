class AddMaestroToCampaments < ActiveRecord::Migration
  def change
    add_column :campaments, :maestro_consejero_id, :integer
  end
end

class AddMaestroToCampaments < ActiveRecord::Migration
  def change
    add_reference :campaments, :maestro_consejero, index: true, foreign_key: true
  end
end

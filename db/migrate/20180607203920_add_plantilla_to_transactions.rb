class AddPlantillaToTransactions < ActiveRecord::Migration
 def self.up
    change_table :transactions do |t|
      t.attachment :plantilla
    end
  end

  def self.down
    remove_attachment :transactions, :plantilla
  end
end

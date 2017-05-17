class AddAttachmentDocumentToOficerAns < ActiveRecord::Migration
  def self.up
    change_table :oficer_ans do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :oficer_ans, :document
  end
end

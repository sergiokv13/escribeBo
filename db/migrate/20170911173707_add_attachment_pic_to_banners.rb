class AddAttachmentPicToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :banners, :pic
  end
end

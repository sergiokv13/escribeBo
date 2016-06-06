class AddAttachmentRegistrationFormToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :registration_form
    end
  end

  def self.down
    remove_attachment :users, :registration_form
  end
end

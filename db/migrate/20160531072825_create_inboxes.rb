class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.text :subject
      t.text :content
      t.integer :user1_id
      t.integer :user2_id


      t.timestamps null: false
    end
  end
end

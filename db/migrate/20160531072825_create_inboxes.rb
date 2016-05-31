class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.text :subject
      t.string :content
      t.references :user1, index: true, foreign_key: true
      t.references :user2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

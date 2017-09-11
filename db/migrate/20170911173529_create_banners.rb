class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
